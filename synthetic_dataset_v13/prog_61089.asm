; DESCRIPTION: Places a blue 82x48 rectangle at position (416, 108).
; PLAN: r0=416(x), r1=108(y), r2=82(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 108
LDI r2, 82
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
