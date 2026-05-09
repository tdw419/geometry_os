; DESCRIPTION: Creates a cyan circular shape at (328, 198) with radius 29.
; PLAN: r0=328(x), r1=198(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 198
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
