; DESCRIPTION: Draws a cyan line from (430, 211) to (165, 89).
; PLAN: r0=430(x1), r1=211(y1), r2=165(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 211
LDI r2, 165
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
