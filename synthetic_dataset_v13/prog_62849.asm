; DESCRIPTION: Places a cyan line segment connecting (382, 182) to (15, 66).
; PLAN: r0=382(x1), r1=182(y1), r2=15(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 182
LDI r2, 15
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
