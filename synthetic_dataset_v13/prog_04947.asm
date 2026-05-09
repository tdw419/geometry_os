; DESCRIPTION: Draws a cyan line from (233, 161) to (493, 230).
; PLAN: r0=233(x1), r1=161(y1), r2=493(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 161
LDI r2, 493
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
