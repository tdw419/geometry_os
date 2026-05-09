; DESCRIPTION: Renders a white box of size 63x32 starting at (219, 197).
; PLAN: r0=219(x), r1=197(y), r2=63(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 197
LDI r2, 63
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
