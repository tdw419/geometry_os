; DESCRIPTION: Composite: Draws a cyan circle centered at (256, 70) with radius 53 then Renders a white box of size 93x32 starting at (399, 33).
; PLAN: r0=256(x), r1=70(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=399(x), r6=33(y), r7=93(width), r8=32(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 70
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 399
LDI r6, 33
LDI r7, 93
LDI r8, 32
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
