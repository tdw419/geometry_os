; DESCRIPTION: Renders a red box of size 12x32 starting at (190, 86).
; PLAN: r0=190(x), r1=86(y), r2=12(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 86
LDI r2, 12
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
