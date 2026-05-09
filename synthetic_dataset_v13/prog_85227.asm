; DESCRIPTION: Renders a white line between points (301, 217) and (154, 111).
; PLAN: r0=301(x1), r1=217(y1), r2=154(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 217
LDI r2, 154
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
