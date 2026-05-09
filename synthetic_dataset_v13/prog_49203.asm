; DESCRIPTION: Composite: Renders a orange line between points (308, 149) and (217, 161) then Creates a yellow rectangular region at (395, 133) spanning 57 by 81 pixels.
; PLAN: r0=308(x1), r1=149(y1), r2=217(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=133(y), r7=57(width), r8=81(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 149
LDI r2, 217
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 133
LDI r7, 57
LDI r8, 81
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
