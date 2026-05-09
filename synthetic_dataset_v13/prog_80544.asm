; DESCRIPTION: Places a purple 95x88 rectangle at position (107, 146).
; PLAN: r0=107(x), r1=146(y), r2=95(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 146
LDI r2, 95
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
