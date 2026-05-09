; DESCRIPTION: Places a cyan circle of radius 77 at center (354, 95).
; PLAN: r0=354(x), r1=95(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 95
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
