; DESCRIPTION: Places a blue 111x115 rectangle at position (387, 90).
; PLAN: r0=387(x), r1=90(y), r2=111(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 90
LDI r2, 111
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
