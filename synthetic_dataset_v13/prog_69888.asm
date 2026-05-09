; DESCRIPTION: Renders a cyan line between points (226, 69) and (351, 154).
; PLAN: r0=226(x1), r1=69(y1), r2=351(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 69
LDI r2, 351
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
