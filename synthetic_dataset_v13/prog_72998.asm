; DESCRIPTION: Renders a white line between points (263, 240) and (270, 132).
; PLAN: r0=263(x1), r1=240(y1), r2=270(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 240
LDI r2, 270
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
