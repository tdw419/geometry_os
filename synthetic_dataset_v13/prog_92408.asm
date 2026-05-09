; DESCRIPTION: Draws a cyan line from (250, 220) to (332, 137).
; PLAN: r0=250(x1), r1=220(y1), r2=332(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 220
LDI r2, 332
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
