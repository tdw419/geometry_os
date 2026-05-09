; DESCRIPTION: Draws a red line from (156, 171) to (29, 195).
; PLAN: r0=156(x1), r1=171(y1), r2=29(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 171
LDI r2, 29
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
