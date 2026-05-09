; DESCRIPTION: Places a yellow circle of radius 79 at center (208, 143).
; PLAN: r0=208(x), r1=143(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 143
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
