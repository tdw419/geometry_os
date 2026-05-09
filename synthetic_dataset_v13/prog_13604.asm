; DESCRIPTION: Composite: Places a orange 69x91 rectangle at position (151, 43) then Places a green dot at position (179, 46).
; PLAN: r0=151(x), r1=43(y), r2=69(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x), r6=46(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 151
LDI r1, 43
LDI r2, 69
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 46
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
