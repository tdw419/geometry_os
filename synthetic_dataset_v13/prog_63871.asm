; DESCRIPTION: Renders a purple box of size 42x50 starting at (309, 21).
; PLAN: r0=309(x), r1=21(y), r2=42(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 21
LDI r2, 42
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
