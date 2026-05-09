; DESCRIPTION: Composite: Places a white 111x55 rectangle at position (125, 179) then Sets a single cyan pixel at (48, 4) then Creates a cyan circular shape at (422, 219) with radius 20.
; PLAN: r0=125(x), r1=179(y), r2=111(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=48(x), r6=4(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=422(x), r11=219(y), r12=20(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 125
LDI r1, 179
LDI r2, 111
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 4
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 422
LDI r11, 219
LDI r12, 20
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
