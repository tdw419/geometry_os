; DESCRIPTION: Places a green line segment connecting (294, 222) to (116, 240).
; PLAN: r0=294(x1), r1=222(y1), r2=116(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 222
LDI r2, 116
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
