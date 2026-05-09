; DESCRIPTION: Composite: Places a red 81x56 rectangle at position (224, 56) then Places a cyan circle of radius 55 at center (266, 180).
; PLAN: r0=224(x), r1=56(y), r2=81(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x), r6=180(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 224
LDI r1, 56
LDI r2, 81
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 180
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
