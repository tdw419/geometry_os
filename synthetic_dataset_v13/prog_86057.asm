; DESCRIPTION: Composite: Places a orange dot at position (23, 54) then Places a green 29x44 rectangle at position (325, 163).
; PLAN: r0=23(x), r1=54(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=325(x), r6=163(y), r7=29(width), r8=44(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 54
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 325
LDI r6, 163
LDI r7, 29
LDI r8, 44
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
