; DESCRIPTION: Composite: Creates a black circular shape at (169, 135) with radius 67 then Places a black 78x54 rectangle at position (305, 126) then Sets a single cyan pixel at (205, 50).
; PLAN: r0=169(x), r1=135(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x), r6=126(y), r7=78(width), r8=54(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=205(x), r11=50(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 169
LDI r1, 135
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 126
LDI r7, 78
LDI r8, 54
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 50
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
