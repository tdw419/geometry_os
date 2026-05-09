; DESCRIPTION: Composite: Renders a magenta disk with center (217, 157) and radius 61 then Places a cyan 56x93 rectangle at position (76, 115) then Sets a single white pixel at (220, 195).
; PLAN: r0=217(x), r1=157(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=76(x), r6=115(y), r7=56(width), r8=93(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=220(x), r11=195(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 217
LDI r1, 157
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 76
LDI r6, 115
LDI r7, 56
LDI r8, 93
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 220
LDI r11, 195
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
