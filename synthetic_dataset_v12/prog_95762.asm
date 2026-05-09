; DESCRIPTION: Draws a green line from (510, 64) to (33, 247).
; PLAN: r0=510(x1), r1=64(y1), r2=33(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 64
LDI r2, 33
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
