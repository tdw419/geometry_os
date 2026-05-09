; DESCRIPTION: Composite: Sets a single cyan pixel at (446, 68) then Renders a magenta box of size 18x27 starting at (332, 144).
; PLAN: r0=446(x), r1=68(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=332(x), r6=144(y), r7=18(width), r8=27(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 446
LDI r1, 68
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 332
LDI r6, 144
LDI r7, 18
LDI r8, 27
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
