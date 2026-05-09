; DESCRIPTION: Draws a green line from (398, 187) to (134, 134).
; PLAN: r0=398(x1), r1=187(y1), r2=134(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 187
LDI r2, 134
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
