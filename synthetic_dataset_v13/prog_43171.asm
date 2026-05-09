; DESCRIPTION: Places a green line segment connecting (387, 213) to (270, 151).
; PLAN: r0=387(x1), r1=213(y1), r2=270(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 213
LDI r2, 270
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
