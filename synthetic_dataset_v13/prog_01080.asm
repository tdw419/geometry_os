; DESCRIPTION: Places a cyan line segment connecting (454, 129) to (447, 19).
; PLAN: r0=454(x1), r1=129(y1), r2=447(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 129
LDI r2, 447
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
