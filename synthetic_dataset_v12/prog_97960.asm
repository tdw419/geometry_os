; DESCRIPTION: Places a cyan circle of radius 71 at center (392, 184).
; PLAN: r0=392(x), r1=184(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 184
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
