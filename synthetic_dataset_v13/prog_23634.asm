; DESCRIPTION: Places a cyan line segment connecting (241, 90) to (494, 134).
; PLAN: r0=241(x1), r1=90(y1), r2=494(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 90
LDI r2, 494
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
