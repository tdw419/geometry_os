; DESCRIPTION: Places a blue line segment connecting (320, 38) to (322, 27).
; PLAN: r0=320(x1), r1=38(y1), r2=322(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 38
LDI r2, 322
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
