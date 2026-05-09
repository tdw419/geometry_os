; DESCRIPTION: Renders a cyan line between points (493, 133) and (102, 199).
; PLAN: r0=493(x1), r1=133(y1), r2=102(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 133
LDI r2, 102
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
