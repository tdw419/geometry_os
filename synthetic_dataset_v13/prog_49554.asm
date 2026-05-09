; DESCRIPTION: Renders a black line between points (27, 80) and (397, 186).
; PLAN: r0=27(x1), r1=80(y1), r2=397(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 80
LDI r2, 397
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
