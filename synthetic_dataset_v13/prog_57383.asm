; DESCRIPTION: Renders a green line between points (253, 253) and (1, 239).
; PLAN: r0=253(x1), r1=253(y1), r2=1(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 253
LDI r2, 1
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
