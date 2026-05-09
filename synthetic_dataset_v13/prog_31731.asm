; DESCRIPTION: Composite: Creates a cyan rectangular region at (433, 81) spanning 50 by 87 pixels then Places a orange dot at position (99, 127).
; PLAN: r0=433(x), r1=81(y), r2=50(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=127(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 433
LDI r1, 81
LDI r2, 50
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 127
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
