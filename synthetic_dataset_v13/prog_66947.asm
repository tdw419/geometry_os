; DESCRIPTION: Places a cyan circle of radius 79 at center (123, 144).
; PLAN: r0=123(x), r1=144(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 144
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
