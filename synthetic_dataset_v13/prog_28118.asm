; DESCRIPTION: Composite: Renders a blue line between points (282, 233) and (13, 98) then Creates a red rectangular region at (406, 44) spanning 99 by 62 pixels.
; PLAN: r0=282(x1), r1=233(y1), r2=13(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=44(y), r7=99(width), r8=62(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 282
LDI r1, 233
LDI r2, 13
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 44
LDI r7, 99
LDI r8, 62
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
