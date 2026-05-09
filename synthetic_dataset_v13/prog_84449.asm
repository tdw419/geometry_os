; DESCRIPTION: Places a cyan line segment connecting (299, 52) to (141, 243).
; PLAN: r0=299(x1), r1=52(y1), r2=141(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 52
LDI r2, 141
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
