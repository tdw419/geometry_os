; DESCRIPTION: Places a cyan line segment connecting (177, 98) to (102, 28).
; PLAN: r0=177(x1), r1=98(y1), r2=102(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 98
LDI r2, 102
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
