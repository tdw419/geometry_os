; DESCRIPTION: Draws a red line from (184, 215) to (56, 126).
; PLAN: r0=184(x1), r1=215(y1), r2=56(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 215
LDI r2, 56
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
