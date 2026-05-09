; DESCRIPTION: Places a cyan line segment connecting (253, 199) to (421, 175).
; PLAN: r0=253(x1), r1=199(y1), r2=421(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 199
LDI r2, 421
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
