; DESCRIPTION: Places a yellow line segment connecting (27, 53) to (380, 209).
; PLAN: r0=27(x1), r1=53(y1), r2=380(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 53
LDI r2, 380
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
