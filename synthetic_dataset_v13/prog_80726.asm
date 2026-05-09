; DESCRIPTION: Composite: Places a purple dot at position (209, 163) then Renders a orange box of size 24x32 starting at (334, 13).
; PLAN: r0=209(x), r1=163(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=334(x), r6=13(y), r7=24(width), r8=32(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 209
LDI r1, 163
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 334
LDI r6, 13
LDI r7, 24
LDI r8, 32
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
