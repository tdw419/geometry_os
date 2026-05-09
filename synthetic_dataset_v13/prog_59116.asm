; DESCRIPTION: Renders a cyan box of size 11x31 starting at (65, 190).
; PLAN: r0=65(x), r1=190(y), r2=11(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 190
LDI r2, 11
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
