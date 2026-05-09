; DESCRIPTION: Composite: Creates a cyan rectangular region at (245, 36) spanning 18 by 76 pixels then Places a magenta dot at position (12, 107).
; PLAN: r0=245(x), r1=36(y), r2=18(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=12(x), r6=107(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 245
LDI r1, 36
LDI r2, 18
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 107
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
