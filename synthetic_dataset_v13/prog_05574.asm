; DESCRIPTION: Composite: Sets a single black pixel at (487, 28) then Renders a blue box of size 64x87 starting at (372, 156).
; PLAN: r0=487(x), r1=28(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=372(x), r6=156(y), r7=64(width), r8=87(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 487
LDI r1, 28
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 372
LDI r6, 156
LDI r7, 64
LDI r8, 87
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
