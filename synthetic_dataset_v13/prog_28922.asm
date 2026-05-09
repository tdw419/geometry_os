; DESCRIPTION: Renders a purple box of size 56x16 starting at (304, 98).
; PLAN: r0=304(x), r1=98(y), r2=56(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 98
LDI r2, 56
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
