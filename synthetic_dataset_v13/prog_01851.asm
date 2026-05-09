; DESCRIPTION: Places a cyan circle of radius 10 at center (352, 214).
; PLAN: r0=352(x), r1=214(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 214
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
