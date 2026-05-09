; DESCRIPTION: Places a cyan line segment connecting (463, 201) to (125, 196).
; PLAN: r0=463(x1), r1=201(y1), r2=125(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 201
LDI r2, 125
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
