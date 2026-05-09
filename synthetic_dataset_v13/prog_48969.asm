; DESCRIPTION: Composite: Creates a white circular shape at (256, 120) with radius 65 then Places a white 32x10 rectangle at position (174, 165) then Places a purple dot at position (506, 94).
; PLAN: r0=256(x), r1=120(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x), r6=165(y), r7=32(width), r8=10(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=506(x), r11=94(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 256
LDI r1, 120
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 165
LDI r7, 32
LDI r8, 10
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 506
LDI r11, 94
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
