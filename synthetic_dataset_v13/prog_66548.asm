; DESCRIPTION: Places a cyan line segment connecting (200, 214) to (36, 5).
; PLAN: r0=200(x1), r1=214(y1), r2=36(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 214
LDI r2, 36
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
