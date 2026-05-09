; DESCRIPTION: Places a blue 47x116 rectangle at position (120, 94).
; PLAN: r0=120(x), r1=94(y), r2=47(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 94
LDI r2, 47
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
