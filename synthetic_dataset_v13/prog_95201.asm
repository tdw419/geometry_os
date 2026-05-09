; DESCRIPTION: Places a cyan line segment connecting (480, 104) to (289, 45).
; PLAN: r0=480(x1), r1=104(y1), r2=289(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 104
LDI r2, 289
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
