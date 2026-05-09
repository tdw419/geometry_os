; DESCRIPTION: Renders a cyan box of size 119x63 starting at (376, 26).
; PLAN: r0=376(x), r1=26(y), r2=119(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 26
LDI r2, 119
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
