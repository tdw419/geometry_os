; DESCRIPTION: Draws a cyan line from (393, 241) to (438, 122).
; PLAN: r0=393(x1), r1=241(y1), r2=438(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 241
LDI r2, 438
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
