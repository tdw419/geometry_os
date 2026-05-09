; DESCRIPTION: Places a blue 46x66 rectangle at position (452, 92).
; PLAN: r0=452(x), r1=92(y), r2=46(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 92
LDI r2, 46
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
