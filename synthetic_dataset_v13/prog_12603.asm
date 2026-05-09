; DESCRIPTION: Renders a yellow line between points (284, 62) and (322, 255).
; PLAN: r0=284(x1), r1=62(y1), r2=322(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 62
LDI r2, 322
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
