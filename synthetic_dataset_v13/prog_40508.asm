; DESCRIPTION: Places a cyan circle of radius 11 at center (209, 198).
; PLAN: r0=209(x), r1=198(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 198
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
