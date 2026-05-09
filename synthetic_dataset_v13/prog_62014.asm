; DESCRIPTION: Places a cyan line segment connecting (318, 48) to (125, 200).
; PLAN: r0=318(x1), r1=48(y1), r2=125(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 48
LDI r2, 125
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
