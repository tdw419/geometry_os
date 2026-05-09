; DESCRIPTION: Places a yellow line segment connecting (28, 59) to (384, 228).
; PLAN: r0=28(x1), r1=59(y1), r2=384(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 59
LDI r2, 384
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
