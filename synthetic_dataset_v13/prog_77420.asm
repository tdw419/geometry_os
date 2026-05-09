; DESCRIPTION: Draws a yellow line from (368, 130) to (487, 237).
; PLAN: r0=368(x1), r1=130(y1), r2=487(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 130
LDI r2, 487
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
