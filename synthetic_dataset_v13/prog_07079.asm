; DESCRIPTION: Places a cyan line segment connecting (247, 9) to (356, 95).
; PLAN: r0=247(x1), r1=9(y1), r2=356(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 9
LDI r2, 356
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
