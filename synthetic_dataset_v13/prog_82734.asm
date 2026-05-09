; DESCRIPTION: Renders a yellow line between points (160, 67) and (384, 39).
; PLAN: r0=160(x1), r1=67(y1), r2=384(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 67
LDI r2, 384
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
