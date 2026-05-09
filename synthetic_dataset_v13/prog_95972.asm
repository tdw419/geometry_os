; DESCRIPTION: Renders a red box of size 91x16 starting at (32, 145).
; PLAN: r0=32(x), r1=145(y), r2=91(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 145
LDI r2, 91
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
