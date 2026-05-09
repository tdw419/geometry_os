; DESCRIPTION: Places a yellow line segment connecting (493, 82) to (294, 139).
; PLAN: r0=493(x1), r1=82(y1), r2=294(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 82
LDI r2, 294
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
