; DESCRIPTION: Renders a green line between points (59, 150) and (247, 108).
; PLAN: r0=59(x1), r1=150(y1), r2=247(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 150
LDI r2, 247
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
