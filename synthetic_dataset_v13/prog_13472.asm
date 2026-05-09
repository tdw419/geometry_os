; DESCRIPTION: Renders a blue box of size 120x37 starting at (130, 38).
; PLAN: r0=130(x), r1=38(y), r2=120(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 38
LDI r2, 120
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
