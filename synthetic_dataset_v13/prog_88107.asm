; DESCRIPTION: Places a cyan line segment connecting (317, 21) to (85, 128).
; PLAN: r0=317(x1), r1=21(y1), r2=85(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 21
LDI r2, 85
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
