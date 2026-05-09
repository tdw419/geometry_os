; DESCRIPTION: Renders a red box of size 102x37 starting at (371, 168).
; PLAN: r0=371(x), r1=168(y), r2=102(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 168
LDI r2, 102
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
