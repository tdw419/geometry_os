; DESCRIPTION: Renders a white box of size 50x25 starting at (32, 136).
; PLAN: r0=32(x), r1=136(y), r2=50(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 136
LDI r2, 50
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
