; DESCRIPTION: Draws a cyan line from (9, 6) to (174, 159).
; PLAN: r0=9(x1), r1=6(y1), r2=174(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 6
LDI r2, 174
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
