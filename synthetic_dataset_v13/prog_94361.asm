; DESCRIPTION: Renders a cyan box of size 15x28 starting at (333, 190).
; PLAN: r0=333(x), r1=190(y), r2=15(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 190
LDI r2, 15
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
