; DESCRIPTION: Composite: Sets a single white pixel at (381, 65) then Renders a orange box of size 16x70 starting at (179, 57).
; PLAN: r0=381(x), r1=65(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=179(x), r6=57(y), r7=16(width), r8=70(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 65
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 179
LDI r6, 57
LDI r7, 16
LDI r8, 70
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
