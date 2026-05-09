; DESCRIPTION: Renders a white line between points (242, 185) and (323, 166).
; PLAN: r0=242(x1), r1=185(y1), r2=323(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 185
LDI r2, 323
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
