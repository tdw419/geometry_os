; DESCRIPTION: Composite: Places a red dot at position (46, 119) then Places a magenta 88x110 rectangle at position (373, 84).
; PLAN: r0=46(x), r1=119(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=373(x), r6=84(y), r7=88(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 46
LDI r1, 119
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 373
LDI r6, 84
LDI r7, 88
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
