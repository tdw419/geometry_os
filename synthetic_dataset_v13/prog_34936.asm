; DESCRIPTION: Draws a green line from (228, 252) to (220, 88).
; PLAN: r0=228(x1), r1=252(y1), r2=220(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 252
LDI r2, 220
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
