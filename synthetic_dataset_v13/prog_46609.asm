; DESCRIPTION: Draws a green line from (480, 38) to (247, 140).
; PLAN: r0=480(x1), r1=38(y1), r2=247(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 38
LDI r2, 247
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
