; DESCRIPTION: Places a purple 50x62 rectangle at position (185, 146).
; PLAN: r0=185(x), r1=146(y), r2=50(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 146
LDI r2, 50
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
