; DESCRIPTION: Composite: Creates a yellow circular shape at (202, 57) with radius 15 then Renders a red box of size 19x76 starting at (469, 57) then Places a red dot at position (309, 80).
; PLAN: r0=202(x), r1=57(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=469(x), r6=57(y), r7=19(width), r8=76(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=309(x), r11=80(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 202
LDI r1, 57
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 469
LDI r6, 57
LDI r7, 19
LDI r8, 76
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 80
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
