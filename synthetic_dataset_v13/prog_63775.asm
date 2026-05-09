; DESCRIPTION: Places a cyan circle of radius 13 at center (493, 169).
; PLAN: r0=493(x), r1=169(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 493
LDI r1, 169
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
