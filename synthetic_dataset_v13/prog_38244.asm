; DESCRIPTION: Renders a cyan box of size 19x93 starting at (11, 61).
; PLAN: r0=11(x), r1=61(y), r2=19(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 61
LDI r2, 19
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
