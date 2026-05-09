; DESCRIPTION: Places a cyan circle of radius 76 at center (230, 173).
; PLAN: r0=230(x), r1=173(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 173
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
