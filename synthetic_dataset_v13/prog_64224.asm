; DESCRIPTION: Renders a white box of size 98x45 starting at (288, 29).
; PLAN: r0=288(x), r1=29(y), r2=98(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 29
LDI r2, 98
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
