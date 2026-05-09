; DESCRIPTION: Renders a yellow line between points (59, 206) and (506, 28).
; PLAN: r0=59(x1), r1=206(y1), r2=506(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 206
LDI r2, 506
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
