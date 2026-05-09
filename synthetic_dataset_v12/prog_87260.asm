; DESCRIPTION: Composite: Creates a cyan circular shape at (33, 150) with radius 13 then Places a black 70x76 rectangle at position (211, 79) then Sets a single blue pixel at (346, 92).
; PLAN: r0=33(x), r1=150(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=211(x), r6=79(y), r7=70(width), r8=76(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x), r11=92(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 33
LDI r1, 150
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 211
LDI r6, 79
LDI r7, 70
LDI r8, 76
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 92
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
