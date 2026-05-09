; DESCRIPTION: Draws a green line from (411, 196) to (446, 199).
; PLAN: r0=411(x1), r1=196(y1), r2=446(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 196
LDI r2, 446
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
