; DESCRIPTION: Renders a green box of size 82x49 starting at (341, 172).
; PLAN: r0=341(x), r1=172(y), r2=82(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 172
LDI r2, 82
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
