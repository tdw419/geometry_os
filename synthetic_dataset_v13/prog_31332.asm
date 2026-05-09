; DESCRIPTION: Composite: Sets a single cyan pixel at (239, 150) then Creates a purple rectangular region at (231, 32) spanning 115 by 95 pixels.
; PLAN: r0=239(x), r1=150(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=231(x), r6=32(y), r7=115(width), r8=95(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 150
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 231
LDI r6, 32
LDI r7, 115
LDI r8, 95
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
