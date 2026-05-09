; DESCRIPTION: Draws a cyan line from (474, 119) to (177, 236).
; PLAN: r0=474(x1), r1=119(y1), r2=177(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 119
LDI r2, 177
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
