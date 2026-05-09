; DESCRIPTION: Draws a cyan line from (126, 169) to (76, 7).
; PLAN: r0=126(x1), r1=169(y1), r2=76(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 169
LDI r2, 76
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
