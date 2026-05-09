; DESCRIPTION: Composite: Places a purple dot at position (13, 28) then Renders a orange box of size 75x102 starting at (233, 150).
; PLAN: r0=13(x), r1=28(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=233(x), r6=150(y), r7=75(width), r8=102(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 13
LDI r1, 28
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 233
LDI r6, 150
LDI r7, 75
LDI r8, 102
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
