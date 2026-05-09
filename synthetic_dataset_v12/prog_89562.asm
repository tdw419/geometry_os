; DESCRIPTION: Renders a white line between points (463, 182) and (363, 111).
; PLAN: r0=463(x1), r1=182(y1), r2=363(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 182
LDI r2, 363
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
