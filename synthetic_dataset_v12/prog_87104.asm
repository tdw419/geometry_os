; DESCRIPTION: Renders a white line between points (52, 144) and (278, 202).
; PLAN: r0=52(x1), r1=144(y1), r2=278(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 144
LDI r2, 278
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
