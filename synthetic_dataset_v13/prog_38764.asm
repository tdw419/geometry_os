; DESCRIPTION: Composite: Places a cyan dot at position (250, 56) then Places a magenta 22x65 rectangle at position (175, 162).
; PLAN: r0=250(x), r1=56(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=175(x), r6=162(y), r7=22(width), r8=65(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 250
LDI r1, 56
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 175
LDI r6, 162
LDI r7, 22
LDI r8, 65
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
