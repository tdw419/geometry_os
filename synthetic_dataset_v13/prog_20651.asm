; DESCRIPTION: Composite: Renders a orange box of size 59x26 starting at (12, 29) then Sets a single cyan pixel at (90, 63).
; PLAN: r0=12(x), r1=29(y), r2=59(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=90(x), r6=63(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 12
LDI r1, 29
LDI r2, 59
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 63
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
