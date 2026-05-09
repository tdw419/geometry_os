; DESCRIPTION: Places a cyan circle of radius 26 at center (415, 203).
; PLAN: r0=415(x), r1=203(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 203
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
