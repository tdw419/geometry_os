; DESCRIPTION: Places a yellow line segment connecting (19, 93) to (126, 86).
; PLAN: r0=19(x1), r1=93(y1), r2=126(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 93
LDI r2, 126
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
