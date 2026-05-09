; DESCRIPTION: Renders a green line between points (368, 174) and (480, 245).
; PLAN: r0=368(x1), r1=174(y1), r2=480(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 174
LDI r2, 480
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
