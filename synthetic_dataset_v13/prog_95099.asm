; DESCRIPTION: Composite: Creates a cyan rectangular region at (450, 87) spanning 51 by 42 pixels then Places a yellow dot at position (412, 159).
; PLAN: r0=450(x), r1=87(y), r2=51(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x), r6=159(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 450
LDI r1, 87
LDI r2, 51
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 159
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
