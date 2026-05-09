; DESCRIPTION: Composite: Renders a green line between points (141, 87) and (13, 249) then Creates a magenta rectangular region at (169, 41) spanning 79 by 76 pixels.
; PLAN: r0=141(x1), r1=87(y1), r2=13(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=41(y), r7=79(width), r8=76(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 87
LDI r2, 13
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 41
LDI r7, 79
LDI r8, 76
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
