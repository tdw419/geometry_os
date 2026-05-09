; DESCRIPTION: Draws a green line from (233, 176) to (510, 50).
; PLAN: r0=233(x1), r1=176(y1), r2=510(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 176
LDI r2, 510
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
