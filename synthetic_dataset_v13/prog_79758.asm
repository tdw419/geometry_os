; DESCRIPTION: Composite: Creates a white rectangular region at (6, 124) spanning 11 by 40 pixels then Sets a single cyan pixel at (228, 132).
; PLAN: r0=6(x), r1=124(y), r2=11(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=228(x), r6=132(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 6
LDI r1, 124
LDI r2, 11
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 132
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
