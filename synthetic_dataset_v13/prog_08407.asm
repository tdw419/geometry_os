; DESCRIPTION: Draws a green line from (16, 8) to (313, 103).
; PLAN: r0=16(x1), r1=8(y1), r2=313(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 8
LDI r2, 313
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
