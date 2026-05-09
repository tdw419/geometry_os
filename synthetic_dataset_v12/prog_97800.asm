; DESCRIPTION: Renders a purple box of size 50x40 starting at (61, 161).
; PLAN: r0=61(x), r1=161(y), r2=50(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 161
LDI r2, 50
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
