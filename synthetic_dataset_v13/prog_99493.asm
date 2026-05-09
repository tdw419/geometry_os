; DESCRIPTION: Renders a cyan box of size 86x20 starting at (119, 72).
; PLAN: r0=119(x), r1=72(y), r2=86(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 72
LDI r2, 86
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
