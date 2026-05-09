; DESCRIPTION: Renders a yellow line between points (258, 239) and (322, 12).
; PLAN: r0=258(x1), r1=239(y1), r2=322(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 239
LDI r2, 322
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
