; DESCRIPTION: Composite: Places a orange dot at position (76, 254) then Renders a red box of size 65x81 starting at (343, 124) then Draws a yellow line from (294, 19) to (200, 99).
; PLAN: r0=76(x), r1=254(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=343(x), r6=124(y), r7=65(width), r8=81(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=294(x1), r11=19(y1), r12=200(x2), r13=99(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 254
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 343
LDI r6, 124
LDI r7, 65
LDI r8, 81
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 19
LDI r12, 200
LDI r13, 99
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
