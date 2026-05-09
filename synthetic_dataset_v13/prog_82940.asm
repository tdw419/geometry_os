; DESCRIPTION: Composite: Places a cyan circle of radius 37 at center (333, 172) then Places a black 59x13 rectangle at position (240, 30) then Places a black dot at position (405, 90).
; PLAN: r0=333(x), r1=172(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x), r6=30(y), r7=59(width), r8=13(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=405(x), r11=90(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 333
LDI r1, 172
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 30
LDI r7, 59
LDI r8, 13
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 90
LDI r12, 0x000000
PSET r10, r11, r12
HALT
