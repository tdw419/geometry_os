; DESCRIPTION: Renders a red box of size 60x113 starting at (170, 82).
; PLAN: r0=170(x), r1=82(y), r2=60(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 82
LDI r2, 60
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
