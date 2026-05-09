; DESCRIPTION: Renders a red line between points (493, 220) and (362, 236).
; PLAN: r0=493(x1), r1=220(y1), r2=362(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 220
LDI r2, 362
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
