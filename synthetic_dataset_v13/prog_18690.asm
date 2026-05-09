; DESCRIPTION: Renders a cyan line between points (442, 170) and (496, 164).
; PLAN: r0=442(x1), r1=170(y1), r2=496(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 170
LDI r2, 496
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
