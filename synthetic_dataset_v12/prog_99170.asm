; DESCRIPTION: Composite: Sets a single cyan pixel at (19, 224) then Renders a white box of size 93x12 starting at (295, 71).
; PLAN: r0=19(x), r1=224(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=295(x), r6=71(y), r7=93(width), r8=12(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 19
LDI r1, 224
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 295
LDI r6, 71
LDI r7, 93
LDI r8, 12
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
