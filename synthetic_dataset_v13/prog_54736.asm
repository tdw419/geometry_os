; DESCRIPTION: Renders a red box of size 48x32 starting at (431, 190).
; PLAN: r0=431(x), r1=190(y), r2=48(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 190
LDI r2, 48
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
