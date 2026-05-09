; DESCRIPTION: Renders a red box of size 32x45 starting at (160, 6).
; PLAN: r0=160(x), r1=6(y), r2=32(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 6
LDI r2, 32
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
