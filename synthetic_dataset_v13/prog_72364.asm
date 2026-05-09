; DESCRIPTION: Composite: Places a green dot at position (403, 198) then Places a magenta line segment connecting (348, 39) to (5, 167) then Draws a cyan rectangle at (161, 31) with width 77 and height 70.
; PLAN: r0=403(x), r1=198(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=348(x1), r6=39(y1), r7=5(x2), r8=167(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=161(x), r11=31(y), r12=77(width), r13=70(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 403
LDI r1, 198
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 348
LDI r6, 39
LDI r7, 5
LDI r8, 167
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 31
LDI r12, 77
LDI r13, 70
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
