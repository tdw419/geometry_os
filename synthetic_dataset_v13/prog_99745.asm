; DESCRIPTION: Places a yellow circle of radius 16 at center (368, 127).
; PLAN: r0=368(x), r1=127(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 127
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
