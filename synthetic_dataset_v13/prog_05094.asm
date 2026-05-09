; DESCRIPTION: Renders a green line between points (402, 191) and (295, 74).
; PLAN: r0=402(x1), r1=191(y1), r2=295(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 191
LDI r2, 295
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
