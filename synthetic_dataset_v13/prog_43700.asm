; DESCRIPTION: Places a blue 75x115 rectangle at position (82, 29).
; PLAN: r0=82(x), r1=29(y), r2=75(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 29
LDI r2, 75
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
