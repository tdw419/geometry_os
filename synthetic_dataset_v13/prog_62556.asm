; DESCRIPTION: Draws a green line from (487, 176) to (290, 252).
; PLAN: r0=487(x1), r1=176(y1), r2=290(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 176
LDI r2, 290
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
