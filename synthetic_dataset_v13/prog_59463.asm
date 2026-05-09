; DESCRIPTION: Draws a red line from (308, 195) to (245, 194).
; PLAN: r0=308(x1), r1=195(y1), r2=245(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 195
LDI r2, 245
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
