; DESCRIPTION: Composite: Sets a single blue pixel at (57, 213) then Renders a orange box of size 20x15 starting at (165, 231).
; PLAN: r0=57(x), r1=213(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=231(y), r7=20(width), r8=15(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 57
LDI r1, 213
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 165
LDI r6, 231
LDI r7, 20
LDI r8, 15
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
