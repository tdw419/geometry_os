; DESCRIPTION: Composite: Sets a single orange pixel at (192, 244) then Renders a purple box of size 42x86 starting at (447, 146).
; PLAN: r0=192(x), r1=244(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=447(x), r6=146(y), r7=42(width), r8=86(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 244
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 447
LDI r6, 146
LDI r7, 42
LDI r8, 86
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
