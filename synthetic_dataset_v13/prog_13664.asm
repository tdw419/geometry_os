; DESCRIPTION: Places a cyan line segment connecting (497, 253) to (402, 218).
; PLAN: r0=497(x1), r1=253(y1), r2=402(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 253
LDI r2, 402
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
