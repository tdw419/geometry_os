; DESCRIPTION: Composite: Places a black 69x39 rectangle at position (294, 205) then Sets a single green pixel at (183, 200).
; PLAN: r0=294(x), r1=205(y), r2=69(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=183(x), r6=200(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 294
LDI r1, 205
LDI r2, 69
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 200
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
