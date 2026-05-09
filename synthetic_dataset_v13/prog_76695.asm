; DESCRIPTION: Places a cyan circle of radius 71 at center (416, 132).
; PLAN: r0=416(x), r1=132(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 132
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
