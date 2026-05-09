; DESCRIPTION: Draws a green line from (475, 146) to (329, 184).
; PLAN: r0=475(x1), r1=146(y1), r2=329(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 146
LDI r2, 329
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
