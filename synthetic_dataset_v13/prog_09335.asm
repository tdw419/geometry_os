; DESCRIPTION: Renders a purple box of size 50x16 starting at (249, 16).
; PLAN: r0=249(x), r1=16(y), r2=50(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 16
LDI r2, 50
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
