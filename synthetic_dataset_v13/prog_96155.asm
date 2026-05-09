; DESCRIPTION: Places a cyan line segment connecting (11, 12) to (20, 178).
; PLAN: r0=11(x1), r1=12(y1), r2=20(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 12
LDI r2, 20
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
