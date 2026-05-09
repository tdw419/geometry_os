; DESCRIPTION: Composite: Places a yellow dot at position (289, 210) then Renders a orange box of size 22x13 starting at (334, 79).
; PLAN: r0=289(x), r1=210(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=334(x), r6=79(y), r7=22(width), r8=13(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 210
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 334
LDI r6, 79
LDI r7, 22
LDI r8, 13
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
