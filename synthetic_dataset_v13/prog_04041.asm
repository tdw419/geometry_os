; DESCRIPTION: Renders a cyan box of size 69x101 starting at (417, 134).
; PLAN: r0=417(x), r1=134(y), r2=69(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 134
LDI r2, 69
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
