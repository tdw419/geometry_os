; DESCRIPTION: Composite: Draws a magenta line from (161, 4) to (135, 44) then Draws a cyan rectangle at (122, 49) with width 28 and height 40.
; PLAN: r0=161(x1), r1=4(y1), r2=135(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=49(y), r7=28(width), r8=40(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 161
LDI r1, 4
LDI r2, 135
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 49
LDI r7, 28
LDI r8, 40
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
