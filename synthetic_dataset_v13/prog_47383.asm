; DESCRIPTION: Places a green line segment connecting (468, 130) to (502, 219).
; PLAN: r0=468(x1), r1=130(y1), r2=502(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 130
LDI r2, 502
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
