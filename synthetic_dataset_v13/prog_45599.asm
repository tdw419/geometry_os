; DESCRIPTION: Places a magenta line segment connecting (327, 130) to (151, 242).
; PLAN: r0=327(x1), r1=130(y1), r2=151(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 130
LDI r2, 151
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
