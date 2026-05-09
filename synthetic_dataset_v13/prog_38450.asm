; DESCRIPTION: Composite: Sets a single red pixel at (308, 218) then Renders a cyan box of size 43x86 starting at (119, 101).
; PLAN: r0=308(x), r1=218(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=119(x), r6=101(y), r7=43(width), r8=86(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 218
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 119
LDI r6, 101
LDI r7, 43
LDI r8, 86
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
