; DESCRIPTION: Composite: Renders a orange box of size 54x67 starting at (11, 32) then Sets a single red pixel at (283, 75).
; PLAN: r0=11(x), r1=32(y), r2=54(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x), r6=75(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 11
LDI r1, 32
LDI r2, 54
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 75
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
