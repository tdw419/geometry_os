; DESCRIPTION: Renders a cyan box of size 19x30 starting at (85, 190).
; PLAN: r0=85(x), r1=190(y), r2=19(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 190
LDI r2, 19
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
