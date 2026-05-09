; DESCRIPTION: Renders a yellow disk with center (408, 231) and radius 10.
; PLAN: r0=408(x), r1=231(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 231
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
