; DESCRIPTION: Composite: Creates a magenta rectangular region at (255, 195) spanning 74 by 54 pixels then Places a purple dot at position (341, 231).
; PLAN: r0=255(x), r1=195(y), r2=74(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=341(x), r6=231(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 255
LDI r1, 195
LDI r2, 74
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 231
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
