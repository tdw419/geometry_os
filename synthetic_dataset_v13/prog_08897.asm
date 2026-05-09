; DESCRIPTION: Places a cyan line segment connecting (226, 181) to (293, 238).
; PLAN: r0=226(x1), r1=181(y1), r2=293(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 181
LDI r2, 293
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
