; DESCRIPTION: Draws a green line from (0, 54) to (330, 208).
; PLAN: r0=0(x1), r1=54(y1), r2=330(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 54
LDI r2, 330
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
