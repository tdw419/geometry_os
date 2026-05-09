; DESCRIPTION: Composite: Places a purple dot at position (280, 252) then Places a magenta 23x86 rectangle at position (382, 18).
; PLAN: r0=280(x), r1=252(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=382(x), r6=18(y), r7=23(width), r8=86(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 252
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 382
LDI r6, 18
LDI r7, 23
LDI r8, 86
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
