; DESCRIPTION: Draws a green line from (5, 154) to (345, 54).
; PLAN: r0=5(x1), r1=154(y1), r2=345(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 154
LDI r2, 345
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
