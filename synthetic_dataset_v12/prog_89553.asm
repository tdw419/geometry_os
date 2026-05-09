; DESCRIPTION: Places a yellow line segment connecting (279, 238) to (434, 215).
; PLAN: r0=279(x1), r1=238(y1), r2=434(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 238
LDI r2, 434
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
