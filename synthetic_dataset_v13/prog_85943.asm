; DESCRIPTION: Composite: Places a blue 16x18 rectangle at position (79, 109) then Sets a single white pixel at (337, 8).
; PLAN: r0=79(x), r1=109(y), r2=16(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x), r6=8(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 79
LDI r1, 109
LDI r2, 16
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 8
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
