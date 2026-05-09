; DESCRIPTION: Draws a red line from (340, 193) to (482, 45).
; PLAN: r0=340(x1), r1=193(y1), r2=482(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 193
LDI r2, 482
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
