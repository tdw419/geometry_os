; DESCRIPTION: Draws a green line from (230, 20) to (488, 120).
; PLAN: r0=230(x1), r1=20(y1), r2=488(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 20
LDI r2, 488
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
