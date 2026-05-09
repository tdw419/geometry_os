; DESCRIPTION: Composite: Draws a white line from (441, 196) to (51, 4) then Renders a cyan box of size 66x113 starting at (197, 142) then Draws a yellow circle centered at (401, 117) with radius 68.
; PLAN: r0=441(x1), r1=196(y1), r2=51(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=142(y), r7=66(width), r8=113(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=401(x), r11=117(y), r12=68(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 441
LDI r1, 196
LDI r2, 51
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 142
LDI r7, 66
LDI r8, 113
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 401
LDI r11, 117
LDI r12, 68
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
