; DESCRIPTION: Composite: Places a orange 27x37 rectangle at position (137, 73) then Sets a single purple pixel at (416, 2).
; PLAN: r0=137(x), r1=73(y), r2=27(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=416(x), r6=2(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 137
LDI r1, 73
LDI r2, 27
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 2
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
