; DESCRIPTION: Draws a red line from (264, 203) to (482, 107).
; PLAN: r0=264(x1), r1=203(y1), r2=482(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 203
LDI r2, 482
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
