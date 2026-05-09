; DESCRIPTION: Renders a purple box of size 22x31 starting at (343, 42).
; PLAN: r0=343(x), r1=42(y), r2=22(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 42
LDI r2, 22
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
