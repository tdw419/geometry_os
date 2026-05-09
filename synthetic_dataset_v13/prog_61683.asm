; DESCRIPTION: Places a cyan line segment connecting (52, 142) to (274, 253).
; PLAN: r0=52(x1), r1=142(y1), r2=274(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 142
LDI r2, 274
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
