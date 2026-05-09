; DESCRIPTION: Places a cyan circle of radius 43 at center (411, 208).
; PLAN: r0=411(x), r1=208(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 208
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
