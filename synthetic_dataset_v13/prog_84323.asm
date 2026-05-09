; DESCRIPTION: Places a cyan line segment connecting (309, 182) to (480, 115).
; PLAN: r0=309(x1), r1=182(y1), r2=480(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 182
LDI r2, 480
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
