; DESCRIPTION: Renders a red box of size 108x46 starting at (98, 172).
; PLAN: r0=98(x), r1=172(y), r2=108(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 172
LDI r2, 108
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
