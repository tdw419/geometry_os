; DESCRIPTION: Places a magenta 14x38 rectangle at position (173, 129).
; PLAN: r0=173(x), r1=129(y), r2=14(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 129
LDI r2, 14
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
