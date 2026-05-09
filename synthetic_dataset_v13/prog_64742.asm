; DESCRIPTION: Composite: Places a purple dot at position (338, 228) then Places a cyan 23x101 rectangle at position (290, 58).
; PLAN: r0=338(x), r1=228(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=290(x), r6=58(y), r7=23(width), r8=101(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 338
LDI r1, 228
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 290
LDI r6, 58
LDI r7, 23
LDI r8, 101
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
