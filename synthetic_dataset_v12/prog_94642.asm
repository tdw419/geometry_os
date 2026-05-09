; DESCRIPTION: Places a cyan circle of radius 25 at center (474, 186).
; PLAN: r0=474(x), r1=186(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 474
LDI r1, 186
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
