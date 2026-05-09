; DESCRIPTION: Renders a purple box of size 10x39 starting at (301, 32).
; PLAN: r0=301(x), r1=32(y), r2=10(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 32
LDI r2, 10
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
