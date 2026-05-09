; DESCRIPTION: Renders a black box of size 111x72 starting at (274, 42).
; PLAN: r0=274(x), r1=42(y), r2=111(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 42
LDI r2, 111
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
