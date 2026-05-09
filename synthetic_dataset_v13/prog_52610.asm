; DESCRIPTION: Places a cyan circle of radius 48 at center (106, 167).
; PLAN: r0=106(x), r1=167(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 167
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
