; DESCRIPTION: Places a cyan circle of radius 39 at center (352, 138).
; PLAN: r0=352(x), r1=138(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 138
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
