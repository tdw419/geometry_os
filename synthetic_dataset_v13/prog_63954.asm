; DESCRIPTION: Renders a cyan box of size 93x18 starting at (86, 87).
; PLAN: r0=86(x), r1=87(y), r2=93(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 87
LDI r2, 93
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
