; DESCRIPTION: Composite: Sets a single green pixel at (242, 243) then Creates a white rectangular region at (195, 143) spanning 60 by 11 pixels.
; PLAN: r0=242(x), r1=243(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=195(x), r6=143(y), r7=60(width), r8=11(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 243
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 195
LDI r6, 143
LDI r7, 60
LDI r8, 11
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
