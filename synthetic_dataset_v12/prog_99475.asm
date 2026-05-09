; DESCRIPTION: Places a cyan line segment connecting (178, 85) to (245, 164).
; PLAN: r0=178(x1), r1=85(y1), r2=245(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 85
LDI r2, 245
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
