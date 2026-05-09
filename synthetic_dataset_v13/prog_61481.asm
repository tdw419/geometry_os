; DESCRIPTION: Draws a cyan line from (250, 74) to (482, 112).
; PLAN: r0=250(x1), r1=74(y1), r2=482(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 74
LDI r2, 482
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
