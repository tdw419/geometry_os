; DESCRIPTION: Composite: Places a orange 46x107 rectangle at position (183, 114) then Sets a single magenta pixel at (350, 236).
; PLAN: r0=183(x), r1=114(y), r2=46(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x), r6=236(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 183
LDI r1, 114
LDI r2, 46
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 236
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
