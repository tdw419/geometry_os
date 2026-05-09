; DESCRIPTION: Draws a green line from (52, 194) to (481, 8).
; PLAN: r0=52(x1), r1=194(y1), r2=481(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 194
LDI r2, 481
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
