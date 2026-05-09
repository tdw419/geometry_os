; DESCRIPTION: Renders a purple box of size 54x43 starting at (42, 38).
; PLAN: r0=42(x), r1=38(y), r2=54(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 38
LDI r2, 54
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
