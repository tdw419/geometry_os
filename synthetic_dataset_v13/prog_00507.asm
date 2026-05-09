; DESCRIPTION: Composite: Sets a single yellow pixel at (84, 144) then Creates a cyan rectangular region at (95, 130) spanning 67 by 27 pixels.
; PLAN: r0=84(x), r1=144(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=95(x), r6=130(y), r7=67(width), r8=27(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 144
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 95
LDI r6, 130
LDI r7, 67
LDI r8, 27
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
