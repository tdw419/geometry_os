; DESCRIPTION: Renders a green box of size 81x36 starting at (383, 190).
; PLAN: r0=383(x), r1=190(y), r2=81(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 190
LDI r2, 81
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
