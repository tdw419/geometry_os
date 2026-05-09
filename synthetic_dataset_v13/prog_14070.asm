; DESCRIPTION: Renders a black box of size 71x42 starting at (429, 163).
; PLAN: r0=429(x), r1=163(y), r2=71(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 163
LDI r2, 71
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
