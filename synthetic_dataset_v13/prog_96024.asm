; DESCRIPTION: Composite: Sets a single cyan pixel at (369, 40) then Places a red 71x102 rectangle at position (234, 45).
; PLAN: r0=369(x), r1=40(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=234(x), r6=45(y), r7=71(width), r8=102(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 40
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 234
LDI r6, 45
LDI r7, 71
LDI r8, 102
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
