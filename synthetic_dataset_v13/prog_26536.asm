; DESCRIPTION: Renders a cyan line between points (274, 23) and (338, 196).
; PLAN: r0=274(x1), r1=23(y1), r2=338(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 23
LDI r2, 338
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
