; DESCRIPTION: Composite: Renders a orange disk with center (68, 46) and radius 42 then Renders a orange box of size 61x69 starting at (200, 46) then Places a black dot at position (172, 112).
; PLAN: r0=68(x), r1=46(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=200(x), r6=46(y), r7=61(width), r8=69(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=172(x), r11=112(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 68
LDI r1, 46
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 200
LDI r6, 46
LDI r7, 61
LDI r8, 69
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 112
LDI r12, 0x000000
PSET r10, r11, r12
HALT
