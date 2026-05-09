; DESCRIPTION: Renders a red box of size 12x107 starting at (192, 82).
; PLAN: r0=192(x), r1=82(y), r2=12(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 82
LDI r2, 12
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
