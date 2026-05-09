; DESCRIPTION: Places a cyan line segment connecting (155, 178) to (50, 254).
; PLAN: r0=155(x1), r1=178(y1), r2=50(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 178
LDI r2, 50
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
