; DESCRIPTION: Renders a purple box of size 42x13 starting at (428, 90).
; PLAN: r0=428(x), r1=90(y), r2=42(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 90
LDI r2, 42
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
