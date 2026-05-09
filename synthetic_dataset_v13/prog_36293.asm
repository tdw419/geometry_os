; DESCRIPTION: Draws a green line from (28, 120) to (7, 127).
; PLAN: r0=28(x1), r1=120(y1), r2=7(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 120
LDI r2, 7
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
