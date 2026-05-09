; DESCRIPTION: Renders a cyan box of size 16x107 starting at (190, 77).
; PLAN: r0=190(x), r1=77(y), r2=16(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 77
LDI r2, 16
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
