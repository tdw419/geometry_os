; DESCRIPTION: Draws a white line from (269, 82) to (248, 20).
; PLAN: r0=269(x1), r1=82(y1), r2=248(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 82
LDI r2, 248
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
