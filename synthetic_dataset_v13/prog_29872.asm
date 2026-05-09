; DESCRIPTION: Places a cyan line segment connecting (273, 165) to (309, 124).
; PLAN: r0=273(x1), r1=165(y1), r2=309(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 165
LDI r2, 309
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
