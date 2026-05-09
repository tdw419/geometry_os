; DESCRIPTION: Renders a cyan box of size 86x101 starting at (20, 2).
; PLAN: r0=20(x), r1=2(y), r2=86(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 2
LDI r2, 86
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
