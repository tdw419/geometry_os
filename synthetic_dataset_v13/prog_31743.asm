; DESCRIPTION: Draws a red line from (229, 48) to (290, 182).
; PLAN: r0=229(x1), r1=48(y1), r2=290(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 48
LDI r2, 290
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
