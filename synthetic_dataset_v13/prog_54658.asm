; DESCRIPTION: Composite: Creates a cyan rectangular region at (190, 23) spanning 85 by 10 pixels then Places a green dot at position (330, 28).
; PLAN: r0=190(x), r1=23(y), r2=85(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x), r6=28(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 190
LDI r1, 23
LDI r2, 85
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 28
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
