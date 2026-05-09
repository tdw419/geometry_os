; DESCRIPTION: Renders a green line between points (41, 252) and (449, 154).
; PLAN: r0=41(x1), r1=252(y1), r2=449(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 252
LDI r2, 449
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
