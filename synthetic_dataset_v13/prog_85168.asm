; DESCRIPTION: Places a blue 56x119 rectangle at position (152, 50).
; PLAN: r0=152(x), r1=50(y), r2=56(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 50
LDI r2, 56
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
