; DESCRIPTION: Draws a cyan line from (211, 159) to (363, 166).
; PLAN: r0=211(x1), r1=159(y1), r2=363(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 159
LDI r2, 363
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
