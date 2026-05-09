; DESCRIPTION: Places a cyan line segment connecting (452, 7) to (90, 37).
; PLAN: r0=452(x1), r1=7(y1), r2=90(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 7
LDI r2, 90
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
