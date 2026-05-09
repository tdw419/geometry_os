; DESCRIPTION: Renders a purple box of size 54x107 starting at (329, 92).
; PLAN: r0=329(x), r1=92(y), r2=54(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 92
LDI r2, 54
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
