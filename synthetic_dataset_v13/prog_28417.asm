; DESCRIPTION: Places a cyan circle of radius 30 at center (374, 113).
; PLAN: r0=374(x), r1=113(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 113
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
