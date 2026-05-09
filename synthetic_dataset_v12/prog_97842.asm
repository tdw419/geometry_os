; DESCRIPTION: Draws a red line from (394, 130) to (385, 48).
; PLAN: r0=394(x1), r1=130(y1), r2=385(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 130
LDI r2, 385
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
