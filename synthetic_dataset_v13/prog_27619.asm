; DESCRIPTION: Composite: Places a red 21x77 rectangle at position (353, 105) then Sets a single green pixel at (228, 202).
; PLAN: r0=353(x), r1=105(y), r2=21(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=228(x), r6=202(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 353
LDI r1, 105
LDI r2, 21
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 202
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
