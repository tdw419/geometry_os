; DESCRIPTION: Renders a green box of size 32x81 starting at (104, 1).
; PLAN: r0=104(x), r1=1(y), r2=32(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 1
LDI r2, 32
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
