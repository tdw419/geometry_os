; DESCRIPTION: Draws a green line from (424, 242) to (68, 150).
; PLAN: r0=424(x1), r1=242(y1), r2=68(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 242
LDI r2, 68
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
