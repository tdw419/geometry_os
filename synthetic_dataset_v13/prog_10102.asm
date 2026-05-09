; DESCRIPTION: Draws a cyan line from (300, 159) to (5, 44).
; PLAN: r0=300(x1), r1=159(y1), r2=5(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 159
LDI r2, 5
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
