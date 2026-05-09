; DESCRIPTION: Places a yellow line segment connecting (174, 239) to (116, 139).
; PLAN: r0=174(x1), r1=239(y1), r2=116(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 239
LDI r2, 116
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
