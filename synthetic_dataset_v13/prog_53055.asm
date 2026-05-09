; DESCRIPTION: Composite: Places a red dot at position (390, 49) then Renders a blue box of size 37x97 starting at (65, 115).
; PLAN: r0=390(x), r1=49(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=65(x), r6=115(y), r7=37(width), r8=97(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 49
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 65
LDI r6, 115
LDI r7, 37
LDI r8, 97
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
