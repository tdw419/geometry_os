; DESCRIPTION: Places a cyan line segment connecting (203, 243) to (177, 143).
; PLAN: r0=203(x1), r1=243(y1), r2=177(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 243
LDI r2, 177
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
