; DESCRIPTION: Places a cyan circle of radius 40 at center (186, 184).
; PLAN: r0=186(x), r1=184(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 184
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
