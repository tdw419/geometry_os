; DESCRIPTION: Composite: Sets a single yellow pixel at (310, 37) then Places a magenta 68x32 rectangle at position (237, 173).
; PLAN: r0=310(x), r1=37(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=237(x), r6=173(y), r7=68(width), r8=32(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 37
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 237
LDI r6, 173
LDI r7, 68
LDI r8, 32
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
