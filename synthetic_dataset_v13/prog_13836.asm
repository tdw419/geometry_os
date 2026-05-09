; DESCRIPTION: Places a green line segment connecting (510, 213) to (26, 64).
; PLAN: r0=510(x1), r1=213(y1), r2=26(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 213
LDI r2, 26
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
