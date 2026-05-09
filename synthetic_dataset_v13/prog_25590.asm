; DESCRIPTION: Draws a green line from (238, 205) to (216, 166).
; PLAN: r0=238(x1), r1=205(y1), r2=216(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 205
LDI r2, 216
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
