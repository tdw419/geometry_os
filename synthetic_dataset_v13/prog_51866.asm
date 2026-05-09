; DESCRIPTION: Composite: Renders a cyan disk with center (279, 146) and radius 79 then Renders a green box of size 69x76 starting at (294, 102) then Places a orange dot at position (172, 87).
; PLAN: r0=279(x), r1=146(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x), r6=102(y), r7=69(width), r8=76(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=172(x), r11=87(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 279
LDI r1, 146
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 102
LDI r7, 69
LDI r8, 76
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 87
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
