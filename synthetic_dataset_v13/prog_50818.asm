; DESCRIPTION: Places a cyan circle of radius 15 at center (245, 198).
; PLAN: r0=245(x), r1=198(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 198
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
