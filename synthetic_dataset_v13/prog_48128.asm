; DESCRIPTION: Composite: Renders a green line between points (350, 140) and (157, 241) then Creates a purple rectangular region at (361, 115) spanning 82 by 35 pixels.
; PLAN: r0=350(x1), r1=140(y1), r2=157(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=361(x), r6=115(y), r7=82(width), r8=35(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 350
LDI r1, 140
LDI r2, 157
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 115
LDI r7, 82
LDI r8, 35
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
