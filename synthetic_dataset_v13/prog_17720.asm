; DESCRIPTION: Draws a cyan line from (87, 246) to (364, 130).
; PLAN: r0=87(x1), r1=246(y1), r2=364(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 246
LDI r2, 364
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
