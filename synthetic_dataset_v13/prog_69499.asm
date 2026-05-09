; DESCRIPTION: Places a yellow line segment connecting (333, 103) to (168, 132).
; PLAN: r0=333(x1), r1=103(y1), r2=168(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 103
LDI r2, 168
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
