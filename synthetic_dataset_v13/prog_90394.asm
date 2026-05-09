; DESCRIPTION: Renders a red box of size 107x68 starting at (324, 82).
; PLAN: r0=324(x), r1=82(y), r2=107(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 82
LDI r2, 107
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
