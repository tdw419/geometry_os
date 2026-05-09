; DESCRIPTION: Renders a purple box of size 107x95 starting at (294, 31).
; PLAN: r0=294(x), r1=31(y), r2=107(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 31
LDI r2, 107
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
