; DESCRIPTION: Renders a red box of size 108x82 starting at (319, 117).
; PLAN: r0=319(x), r1=117(y), r2=108(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 117
LDI r2, 108
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
