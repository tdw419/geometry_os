; DESCRIPTION: Places a red line segment connecting (370, 197) to (311, 166).
; PLAN: r0=370(x1), r1=197(y1), r2=311(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 197
LDI r2, 311
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
