; DESCRIPTION: Composite: Sets a single magenta pixel at (259, 53) then Creates a cyan rectangular region at (24, 184) spanning 94 by 47 pixels.
; PLAN: r0=259(x), r1=53(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=24(x), r6=184(y), r7=94(width), r8=47(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 53
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 24
LDI r6, 184
LDI r7, 94
LDI r8, 47
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
