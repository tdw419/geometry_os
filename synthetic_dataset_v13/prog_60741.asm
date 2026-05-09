; DESCRIPTION: Composite: Sets a single cyan pixel at (264, 163) then Places a orange 55x69 rectangle at position (367, 21).
; PLAN: r0=264(x), r1=163(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=367(x), r6=21(y), r7=55(width), r8=69(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 163
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 367
LDI r6, 21
LDI r7, 55
LDI r8, 69
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
