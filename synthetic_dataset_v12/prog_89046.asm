; DESCRIPTION: Draws a cyan circle centered at (154, 74) with radius 34.
; PLAN: r0=154(x), r1=74(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 74
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
