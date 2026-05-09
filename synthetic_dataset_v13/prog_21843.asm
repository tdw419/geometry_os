; DESCRIPTION: Renders a white box of size 20x25 starting at (230, 29).
; PLAN: r0=230(x), r1=29(y), r2=20(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 29
LDI r2, 20
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
