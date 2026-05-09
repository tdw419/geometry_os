; DESCRIPTION: Places a cyan line segment connecting (449, 219) to (446, 96).
; PLAN: r0=449(x1), r1=219(y1), r2=446(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 219
LDI r2, 446
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
