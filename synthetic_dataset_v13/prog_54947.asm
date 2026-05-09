; DESCRIPTION: Renders a white line between points (154, 177) and (351, 209).
; PLAN: r0=154(x1), r1=177(y1), r2=351(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 177
LDI r2, 351
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
