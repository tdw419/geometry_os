; DESCRIPTION: Composite: Sets a single purple pixel at (60, 42) then Renders a cyan box of size 79x117 starting at (66, 52).
; PLAN: r0=60(x), r1=42(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=66(x), r6=52(y), r7=79(width), r8=117(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 60
LDI r1, 42
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 66
LDI r6, 52
LDI r7, 79
LDI r8, 117
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
