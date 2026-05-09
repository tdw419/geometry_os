; DESCRIPTION: Draws a red line from (64, 45) to (458, 150).
; PLAN: r0=64(x1), r1=45(y1), r2=458(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 45
LDI r2, 458
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
