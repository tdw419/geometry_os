; DESCRIPTION: Composite: Sets a single purple pixel at (54, 237) then Creates a cyan rectangular region at (241, 44) spanning 57 by 64 pixels.
; PLAN: r0=54(x), r1=237(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=44(y), r7=57(width), r8=64(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 54
LDI r1, 237
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 241
LDI r6, 44
LDI r7, 57
LDI r8, 64
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
