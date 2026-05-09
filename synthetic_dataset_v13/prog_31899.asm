; DESCRIPTION: Draws a cyan line from (433, 136) to (52, 34).
; PLAN: r0=433(x1), r1=136(y1), r2=52(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 136
LDI r2, 52
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
