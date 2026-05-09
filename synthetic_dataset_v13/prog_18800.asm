; DESCRIPTION: Places a blue 29x46 rectangle at position (112, 30).
; PLAN: r0=112(x), r1=30(y), r2=29(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 30
LDI r2, 29
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
