; DESCRIPTION: Renders a cyan box of size 84x22 starting at (136, 190).
; PLAN: r0=136(x), r1=190(y), r2=84(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 190
LDI r2, 84
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
