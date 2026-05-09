; DESCRIPTION: Places a cyan line segment connecting (68, 21) to (10, 226).
; PLAN: r0=68(x1), r1=21(y1), r2=10(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 21
LDI r2, 10
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
