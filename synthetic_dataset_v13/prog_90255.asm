; DESCRIPTION: Composite: Sets a single magenta pixel at (42, 11) then Creates a cyan rectangular region at (374, 126) spanning 50 by 42 pixels.
; PLAN: r0=42(x), r1=11(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=126(y), r7=50(width), r8=42(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 42
LDI r1, 11
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 374
LDI r6, 126
LDI r7, 50
LDI r8, 42
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
