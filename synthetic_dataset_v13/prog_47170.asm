; DESCRIPTION: Places a purple 33x50 rectangle at position (33, 95).
; PLAN: r0=33(x), r1=95(y), r2=33(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 95
LDI r2, 33
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
