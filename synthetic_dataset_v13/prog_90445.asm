; DESCRIPTION: Draws a yellow line from (413, 93) to (488, 203).
; PLAN: r0=413(x1), r1=93(y1), r2=488(x2), r3=203(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 93
LDI r2, 488
LDI r3, 203
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
