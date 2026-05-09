; DESCRIPTION: Places a purple 95x55 rectangle at position (152, 50).
; PLAN: r0=152(x), r1=50(y), r2=95(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 50
LDI r2, 95
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
