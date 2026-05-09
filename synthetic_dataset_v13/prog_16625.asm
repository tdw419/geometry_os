; DESCRIPTION: Places a blue 46x54 rectangle at position (29, 173).
; PLAN: r0=29(x), r1=173(y), r2=46(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 173
LDI r2, 46
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
