; DESCRIPTION: Places a cyan line segment connecting (187, 182) to (285, 84).
; PLAN: r0=187(x1), r1=182(y1), r2=285(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 182
LDI r2, 285
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
