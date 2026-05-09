; DESCRIPTION: Draws a green line from (360, 171) to (216, 187).
; PLAN: r0=360(x1), r1=171(y1), r2=216(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 171
LDI r2, 216
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
