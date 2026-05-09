; DESCRIPTION: Renders a red line between points (372, 67) and (245, 23).
; PLAN: r0=372(x1), r1=67(y1), r2=245(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 67
LDI r2, 245
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
