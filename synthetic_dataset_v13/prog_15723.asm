; DESCRIPTION: Places a blue 112x46 rectangle at position (253, 12).
; PLAN: r0=253(x), r1=12(y), r2=112(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 12
LDI r2, 112
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
