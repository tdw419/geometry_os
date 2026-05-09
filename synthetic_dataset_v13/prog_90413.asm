; DESCRIPTION: Draws a red line from (450, 130) to (417, 237).
; PLAN: r0=450(x1), r1=130(y1), r2=417(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 130
LDI r2, 417
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
