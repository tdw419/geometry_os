; DESCRIPTION: Composite: Places a white 50x72 rectangle at position (90, 182) then Creates a green circular shape at (259, 204) with radius 46 then Places a magenta dot at position (295, 10).
; PLAN: r0=90(x), r1=182(y), r2=50(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=259(x), r6=204(y), r7=46(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=295(x), r11=10(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 90
LDI r1, 182
LDI r2, 50
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 204
LDI r7, 46
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 295
LDI r11, 10
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
