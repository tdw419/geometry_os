; DESCRIPTION: Composite: Draws a orange rectangle at (333, 158) with width 53 and height 95 then Draws a magenta line from (121, 215) to (18, 113) then Places a green dot at position (33, 135).
; PLAN: r0=333(x), r1=158(y), r2=53(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=121(x1), r6=215(y1), r7=18(x2), r8=113(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=33(x), r11=135(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 333
LDI r1, 158
LDI r2, 53
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 215
LDI r7, 18
LDI r8, 113
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 33
LDI r11, 135
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
