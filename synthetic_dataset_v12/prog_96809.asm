; DESCRIPTION: Renders a white box of size 32x102 starting at (237, 82).
; PLAN: r0=237(x), r1=82(y), r2=32(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 82
LDI r2, 32
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
