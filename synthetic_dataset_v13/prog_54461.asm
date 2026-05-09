; DESCRIPTION: Composite: Renders a orange line between points (215, 133) and (121, 86) then Creates a orange rectangular region at (123, 80) spanning 64 by 13 pixels.
; PLAN: r0=215(x1), r1=133(y1), r2=121(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=123(x), r6=80(y), r7=64(width), r8=13(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 215
LDI r1, 133
LDI r2, 121
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 80
LDI r7, 64
LDI r8, 13
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
