; DESCRIPTION: Composite: Places a blue 83x29 rectangle at position (320, 223) then Sets a single purple pixel at (465, 122).
; PLAN: r0=320(x), r1=223(y), r2=83(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x), r6=122(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 320
LDI r1, 223
LDI r2, 83
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 122
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
