; DESCRIPTION: Draws a green line from (242, 72) to (449, 74).
; PLAN: r0=242(x1), r1=72(y1), r2=449(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 72
LDI r2, 449
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
