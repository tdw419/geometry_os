; DESCRIPTION: Renders a green box of size 56x38 starting at (175, 190).
; PLAN: r0=175(x), r1=190(y), r2=56(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 190
LDI r2, 56
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
