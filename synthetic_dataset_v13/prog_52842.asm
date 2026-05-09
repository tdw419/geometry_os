; DESCRIPTION: Places a blue 52x46 rectangle at position (104, 1).
; PLAN: r0=104(x), r1=1(y), r2=52(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 1
LDI r2, 52
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
