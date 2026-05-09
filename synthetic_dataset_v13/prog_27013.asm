; DESCRIPTION: Composite: Places a cyan circle of radius 52 at center (225, 166) then Places a purple 103x94 rectangle at position (259, 126) then Sets a single white pixel at (234, 117).
; PLAN: r0=225(x), r1=166(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=259(x), r6=126(y), r7=103(width), r8=94(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=234(x), r11=117(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 225
LDI r1, 166
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 259
LDI r6, 126
LDI r7, 103
LDI r8, 94
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 117
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
