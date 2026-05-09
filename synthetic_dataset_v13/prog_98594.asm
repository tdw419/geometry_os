; DESCRIPTION: Draws a red line from (340, 195) to (148, 244).
; PLAN: r0=340(x1), r1=195(y1), r2=148(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 195
LDI r2, 148
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
