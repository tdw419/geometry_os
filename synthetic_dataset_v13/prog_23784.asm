; DESCRIPTION: Draws a cyan line from (478, 187) to (350, 52).
; PLAN: r0=478(x1), r1=187(y1), r2=350(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 187
LDI r2, 350
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
