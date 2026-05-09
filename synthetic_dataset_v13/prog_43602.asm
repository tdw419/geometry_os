; DESCRIPTION: Composite: Places a red circle of radius 77 at center (391, 103) then Places a green 115x42 rectangle at position (79, 44) then Sets a single blue pixel at (358, 231).
; PLAN: r0=391(x), r1=103(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x), r6=44(y), r7=115(width), r8=42(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=358(x), r11=231(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 391
LDI r1, 103
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 44
LDI r7, 115
LDI r8, 42
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 231
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
