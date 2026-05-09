; DESCRIPTION: Draws a cyan line from (178, 166) to (432, 110).
; PLAN: r0=178(x1), r1=166(y1), r2=432(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 166
LDI r2, 432
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
