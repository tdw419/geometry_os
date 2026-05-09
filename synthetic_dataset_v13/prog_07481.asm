; DESCRIPTION: Composite: Sets a single white pixel at (67, 128) then Renders a purple line between points (248, 127) and (507, 255).
; PLAN: r0=67(x), r1=128(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=248(x1), r6=127(y1), r7=507(x2), r8=255(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 128
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 248
LDI r6, 127
LDI r7, 507
LDI r8, 255
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
