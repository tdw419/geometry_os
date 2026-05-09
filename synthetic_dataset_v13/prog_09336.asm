; DESCRIPTION: Draws a red line from (114, 98) to (256, 28).
; PLAN: r0=114(x1), r1=98(y1), r2=256(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 98
LDI r2, 256
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
