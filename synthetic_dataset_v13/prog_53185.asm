; DESCRIPTION: Places a cyan line segment connecting (177, 106) to (203, 82).
; PLAN: r0=177(x1), r1=106(y1), r2=203(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 106
LDI r2, 203
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
