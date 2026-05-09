; DESCRIPTION: Composite: Renders a red box of size 24x84 starting at (199, 70) then Creates a red circular shape at (65, 56) with radius 50 then Places a cyan dot at position (258, 31).
; PLAN: r0=199(x), r1=70(y), r2=24(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x), r6=56(y), r7=50(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=258(x), r11=31(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 199
LDI r1, 70
LDI r2, 24
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 56
LDI r7, 50
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 258
LDI r11, 31
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
