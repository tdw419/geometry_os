; DESCRIPTION: Places a cyan circle of radius 20 at center (455, 186).
; PLAN: r0=455(x), r1=186(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 186
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
