; DESCRIPTION: Renders a blue box of size 98x75 starting at (303, 167).
; PLAN: r0=303(x), r1=167(y), r2=98(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 167
LDI r2, 98
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
