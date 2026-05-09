; DESCRIPTION: Places a yellow line segment connecting (405, 54) to (168, 246).
; PLAN: r0=405(x1), r1=54(y1), r2=168(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 54
LDI r2, 168
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
