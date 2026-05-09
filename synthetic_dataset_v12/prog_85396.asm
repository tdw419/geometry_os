; DESCRIPTION: Creates a cyan circular shape at (428, 154) with radius 46.
; PLAN: r0=428(x), r1=154(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 154
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
