; DESCRIPTION: Renders a red box of size 82x60 starting at (389, 115).
; PLAN: r0=389(x), r1=115(y), r2=82(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 115
LDI r2, 82
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
