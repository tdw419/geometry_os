; DESCRIPTION: Renders a green line between points (178, 247) and (402, 59).
; PLAN: r0=178(x1), r1=247(y1), r2=402(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 247
LDI r2, 402
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
