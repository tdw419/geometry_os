; DESCRIPTION: Renders a cyan line between points (362, 2) and (337, 10).
; PLAN: r0=362(x1), r1=2(y1), r2=337(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 2
LDI r2, 337
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
