; DESCRIPTION: Renders a yellow line between points (449, 187) and (286, 236).
; PLAN: r0=449(x1), r1=187(y1), r2=286(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 187
LDI r2, 286
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
