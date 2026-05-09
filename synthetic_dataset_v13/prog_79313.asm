; DESCRIPTION: Renders a white line between points (456, 254) and (269, 235).
; PLAN: r0=456(x1), r1=254(y1), r2=269(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 254
LDI r2, 269
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
