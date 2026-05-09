; DESCRIPTION: Renders a blue box of size 54x81 starting at (445, 50).
; PLAN: r0=445(x), r1=50(y), r2=54(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 50
LDI r2, 54
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
