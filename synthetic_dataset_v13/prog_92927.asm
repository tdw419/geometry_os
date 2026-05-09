; DESCRIPTION: Renders a red box of size 60x117 starting at (9, 82).
; PLAN: r0=9(x), r1=82(y), r2=60(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 82
LDI r2, 60
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
