; DESCRIPTION: Places a magenta 46x95 rectangle at position (379, 153).
; PLAN: r0=379(x), r1=153(y), r2=46(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 153
LDI r2, 46
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
