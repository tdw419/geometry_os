; DESCRIPTION: Places a cyan circle of radius 14 at center (403, 143).
; PLAN: r0=403(x), r1=143(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 143
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
