; DESCRIPTION: Places a green line segment connecting (262, 130) to (447, 177).
; PLAN: r0=262(x1), r1=130(y1), r2=447(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 130
LDI r2, 447
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
