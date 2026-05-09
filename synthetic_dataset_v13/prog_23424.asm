; DESCRIPTION: Draws a cyan line from (6, 137) to (200, 209).
; PLAN: r0=6(x1), r1=137(y1), r2=200(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 137
LDI r2, 200
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
