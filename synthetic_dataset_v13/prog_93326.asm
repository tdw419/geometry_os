; DESCRIPTION: Creates a cyan circular shape at (322, 154) with radius 35.
; PLAN: r0=322(x), r1=154(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 154
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
