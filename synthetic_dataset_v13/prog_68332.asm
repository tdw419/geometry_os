; DESCRIPTION: Creates a cyan circular shape at (298, 135) with radius 48.
; PLAN: r0=298(x), r1=135(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 135
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
