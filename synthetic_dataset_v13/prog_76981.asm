; DESCRIPTION: Composite: Places a red 93x116 rectangle at position (339, 32) then Sets a single cyan pixel at (128, 147).
; PLAN: r0=339(x), r1=32(y), r2=93(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=128(x), r6=147(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 339
LDI r1, 32
LDI r2, 93
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 147
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
