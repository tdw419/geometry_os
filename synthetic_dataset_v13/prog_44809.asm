; DESCRIPTION: Places a cyan circle of radius 69 at center (135, 118).
; PLAN: r0=135(x), r1=118(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 118
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
