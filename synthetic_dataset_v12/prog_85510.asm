; DESCRIPTION: Places a blue 57x102 rectangle at position (221, 103).
; PLAN: r0=221(x), r1=103(y), r2=57(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 103
LDI r2, 57
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
