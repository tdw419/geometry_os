; DESCRIPTION: Renders a red box of size 37x28 starting at (76, 225).
; PLAN: r0=76(x), r1=225(y), r2=37(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 225
LDI r2, 37
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
