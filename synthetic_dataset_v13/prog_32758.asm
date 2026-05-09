; DESCRIPTION: Draws a green line from (437, 209) to (35, 115).
; PLAN: r0=437(x1), r1=209(y1), r2=35(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 209
LDI r2, 35
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
