; DESCRIPTION: Places a blue 75x108 rectangle at position (243, 95).
; PLAN: r0=243(x), r1=95(y), r2=75(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 95
LDI r2, 75
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
