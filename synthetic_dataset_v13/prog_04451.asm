; DESCRIPTION: Places a cyan circle of radius 29 at center (360, 141).
; PLAN: r0=360(x), r1=141(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 141
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
