; DESCRIPTION: Places a cyan line segment connecting (338, 17) to (32, 250).
; PLAN: r0=338(x1), r1=17(y1), r2=32(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 17
LDI r2, 32
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
