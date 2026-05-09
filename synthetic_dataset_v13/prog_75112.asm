; DESCRIPTION: Composite: Places a magenta dot at position (271, 63) then Places a red 32x13 rectangle at position (474, 22).
; PLAN: r0=271(x), r1=63(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=474(x), r6=22(y), r7=32(width), r8=13(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 63
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 474
LDI r6, 22
LDI r7, 32
LDI r8, 13
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
