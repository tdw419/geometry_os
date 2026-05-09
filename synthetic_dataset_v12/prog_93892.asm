; DESCRIPTION: Draws a red line from (52, 210) to (255, 156).
; PLAN: r0=52(x1), r1=210(y1), r2=255(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 210
LDI r2, 255
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
