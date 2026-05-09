; DESCRIPTION: Composite: Renders a magenta box of size 84x54 starting at (203, 9) then Places a white dot at position (495, 111).
; PLAN: r0=203(x), r1=9(y), r2=84(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=495(x), r6=111(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 203
LDI r1, 9
LDI r2, 84
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 111
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
