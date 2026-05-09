; DESCRIPTION: Places a cyan circle of radius 39 at center (346, 180).
; PLAN: r0=346(x), r1=180(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 180
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
