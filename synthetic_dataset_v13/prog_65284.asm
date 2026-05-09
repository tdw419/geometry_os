; DESCRIPTION: Renders a red box of size 37x46 starting at (246, 29).
; PLAN: r0=246(x), r1=29(y), r2=37(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 29
LDI r2, 37
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
