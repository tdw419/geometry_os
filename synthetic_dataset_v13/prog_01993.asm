; DESCRIPTION: Composite: Creates a cyan rectangular region at (28, 107) spanning 45 by 13 pixels then Places a blue dot at position (242, 175).
; PLAN: r0=28(x), r1=107(y), r2=45(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=242(x), r6=175(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 28
LDI r1, 107
LDI r2, 45
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 175
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
