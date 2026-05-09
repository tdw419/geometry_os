; DESCRIPTION: Renders a red line between points (436, 222) and (319, 146).
; PLAN: r0=436(x1), r1=222(y1), r2=319(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 222
LDI r2, 319
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
