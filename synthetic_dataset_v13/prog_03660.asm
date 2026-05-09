; DESCRIPTION: Composite: Renders a purple box of size 76x116 starting at (228, 1) then Places a cyan circle of radius 65 at center (264, 171) then Places a orange dot at position (467, 184).
; PLAN: r0=228(x), r1=1(y), r2=76(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=264(x), r6=171(y), r7=65(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=467(x), r11=184(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 228
LDI r1, 1
LDI r2, 76
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 171
LDI r7, 65
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 467
LDI r11, 184
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
