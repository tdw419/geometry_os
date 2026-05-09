; DESCRIPTION: Composite: Sets a single blue pixel at (413, 64) then Renders a yellow box of size 32x94 starting at (280, 68).
; PLAN: r0=413(x), r1=64(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=68(y), r7=32(width), r8=94(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 413
LDI r1, 64
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 280
LDI r6, 68
LDI r7, 32
LDI r8, 94
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
