; DESCRIPTION: Renders a cyan box of size 21x78 starting at (490, 156).
; PLAN: r0=490(x), r1=156(y), r2=21(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 156
LDI r2, 21
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
