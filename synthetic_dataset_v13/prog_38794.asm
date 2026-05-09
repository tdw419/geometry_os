; DESCRIPTION: Places a white line segment connecting (214, 196) to (64, 198).
; PLAN: r0=214(x1), r1=196(y1), r2=64(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 196
LDI r2, 64
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
