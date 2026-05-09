; DESCRIPTION: Places a purple 113x24 rectangle at position (270, 55).
; PLAN: r0=270(x), r1=55(y), r2=113(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 55
LDI r2, 113
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
