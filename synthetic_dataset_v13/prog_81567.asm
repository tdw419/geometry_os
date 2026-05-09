; DESCRIPTION: Draws a red line from (10, 27) to (394, 129).
; PLAN: r0=10(x1), r1=27(y1), r2=394(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 27
LDI r2, 394
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
