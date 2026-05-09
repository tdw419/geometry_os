; DESCRIPTION: Draws a purple line from (297, 182) to (92, 111).
; PLAN: r0=297(x1), r1=182(y1), r2=92(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 182
LDI r2, 92
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
