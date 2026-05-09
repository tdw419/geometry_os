; DESCRIPTION: Places a cyan line segment connecting (27, 61) to (452, 39).
; PLAN: r0=27(x1), r1=61(y1), r2=452(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 61
LDI r2, 452
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
