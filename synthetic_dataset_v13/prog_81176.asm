; DESCRIPTION: Composite: Places a red 42x57 rectangle at position (41, 21) then Sets a single orange pixel at (450, 209).
; PLAN: r0=41(x), r1=21(y), r2=42(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x), r6=209(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 41
LDI r1, 21
LDI r2, 42
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 209
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
