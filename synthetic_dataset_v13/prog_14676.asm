; DESCRIPTION: Places a cyan line segment connecting (71, 155) to (193, 57).
; PLAN: r0=71(x1), r1=155(y1), r2=193(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 155
LDI r2, 193
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
