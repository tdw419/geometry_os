; DESCRIPTION: Composite: Sets a single cyan pixel at (205, 206) then Places a magenta 91x68 rectangle at position (218, 101).
; PLAN: r0=205(x), r1=206(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=218(x), r6=101(y), r7=91(width), r8=68(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 206
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 218
LDI r6, 101
LDI r7, 91
LDI r8, 68
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
