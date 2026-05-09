; DESCRIPTION: Places a cyan line segment connecting (449, 243) to (206, 217).
; PLAN: r0=449(x1), r1=243(y1), r2=206(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 243
LDI r2, 206
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
