; DESCRIPTION: Composite: Places a cyan 66x57 rectangle at position (52, 152) then Sets a single red pixel at (495, 228).
; PLAN: r0=52(x), r1=152(y), r2=66(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=495(x), r6=228(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 52
LDI r1, 152
LDI r2, 66
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 228
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
