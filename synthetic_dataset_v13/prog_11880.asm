; DESCRIPTION: Composite: Renders a white box of size 70x83 starting at (57, 42) then Renders a yellow disk with center (255, 77) and radius 64.
; PLAN: r0=57(x), r1=42(y), r2=70(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x), r6=77(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 57
LDI r1, 42
LDI r2, 70
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 77
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
