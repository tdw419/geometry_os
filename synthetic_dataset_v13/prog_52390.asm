; DESCRIPTION: Creates a cyan circular shape at (328, 153) with radius 70.
; PLAN: r0=328(x), r1=153(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 153
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
