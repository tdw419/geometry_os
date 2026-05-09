; DESCRIPTION: Places a blue 120x82 rectangle at position (384, 2).
; PLAN: r0=384(x), r1=2(y), r2=120(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 2
LDI r2, 120
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
