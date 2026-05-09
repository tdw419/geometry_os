; DESCRIPTION: Composite: Creates a green rectangular region at (473, 28) spanning 25 by 115 pixels then Places a magenta dot at position (445, 8).
; PLAN: r0=473(x), r1=28(y), r2=25(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x), r6=8(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 473
LDI r1, 28
LDI r2, 25
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 8
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
