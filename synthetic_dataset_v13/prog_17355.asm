; DESCRIPTION: Draws a red line from (414, 164) to (394, 26).
; PLAN: r0=414(x1), r1=164(y1), r2=394(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 164
LDI r2, 394
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
