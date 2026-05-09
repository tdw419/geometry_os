; DESCRIPTION: Places a blue 58x49 rectangle at position (304, 173).
; PLAN: r0=304(x), r1=173(y), r2=58(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 173
LDI r2, 58
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
