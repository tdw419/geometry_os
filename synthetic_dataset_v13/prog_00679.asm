; DESCRIPTION: Renders a yellow disk with center (465, 173) and radius 10.
; PLAN: r0=465(x), r1=173(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 173
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
