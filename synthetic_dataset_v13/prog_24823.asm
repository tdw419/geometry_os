; DESCRIPTION: Composite: Sets a single cyan pixel at (343, 12) then Renders a cyan box of size 44x86 starting at (4, 1).
; PLAN: r0=343(x), r1=12(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=4(x), r6=1(y), r7=44(width), r8=86(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 12
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 4
LDI r6, 1
LDI r7, 44
LDI r8, 86
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
