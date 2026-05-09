; DESCRIPTION: Renders a purple box of size 87x102 starting at (154, 98).
; PLAN: r0=154(x), r1=98(y), r2=87(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 98
LDI r2, 87
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
