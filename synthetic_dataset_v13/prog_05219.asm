; DESCRIPTION: Places a cyan circle of radius 25 at center (103, 135).
; PLAN: r0=103(x), r1=135(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 135
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
