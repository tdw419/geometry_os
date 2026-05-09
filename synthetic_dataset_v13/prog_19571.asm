; DESCRIPTION: Renders a yellow line between points (298, 67) and (3, 243).
; PLAN: r0=298(x1), r1=67(y1), r2=3(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 67
LDI r2, 3
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
