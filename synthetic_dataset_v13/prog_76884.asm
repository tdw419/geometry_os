; DESCRIPTION: Composite: Sets a single cyan pixel at (220, 178) then Creates a red rectangular region at (273, 113) spanning 65 by 20 pixels.
; PLAN: r0=220(x), r1=178(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=273(x), r6=113(y), r7=65(width), r8=20(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 220
LDI r1, 178
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 273
LDI r6, 113
LDI r7, 65
LDI r8, 20
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
