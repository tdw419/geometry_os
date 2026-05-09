; DESCRIPTION: Renders a purple box of size 16x50 starting at (259, 56).
; PLAN: r0=259(x), r1=56(y), r2=16(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 56
LDI r2, 16
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
