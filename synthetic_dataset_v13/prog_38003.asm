; DESCRIPTION: Draws a cyan line from (195, 111) to (508, 137).
; PLAN: r0=195(x1), r1=111(y1), r2=508(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 111
LDI r2, 508
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
