; DESCRIPTION: Draws a green line from (486, 187) to (445, 148).
; PLAN: r0=486(x1), r1=187(y1), r2=445(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 187
LDI r2, 445
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
