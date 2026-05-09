; DESCRIPTION: Draws a red line from (27, 10) to (111, 161).
; PLAN: r0=27(x1), r1=10(y1), r2=111(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 10
LDI r2, 111
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
