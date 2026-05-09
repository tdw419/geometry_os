; DESCRIPTION: Draws a red line from (284, 250) to (211, 109).
; PLAN: r0=284(x1), r1=250(y1), r2=211(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 250
LDI r2, 211
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
