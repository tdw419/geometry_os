; DESCRIPTION: Composite: Renders a orange box of size 18x102 starting at (320, 67) then Sets a single orange pixel at (15, 133).
; PLAN: r0=320(x), r1=67(y), r2=18(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=15(x), r6=133(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 320
LDI r1, 67
LDI r2, 18
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 133
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
