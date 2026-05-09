; DESCRIPTION: Draws a red line from (167, 82) to (234, 68).
; PLAN: r0=167(x1), r1=82(y1), r2=234(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 82
LDI r2, 234
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
