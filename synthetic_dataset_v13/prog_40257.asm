; DESCRIPTION: Draws a cyan line from (318, 71) to (236, 176).
; PLAN: r0=318(x1), r1=71(y1), r2=236(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 71
LDI r2, 236
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
