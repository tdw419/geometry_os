; DESCRIPTION: Places a blue 43x60 rectangle at position (458, 20).
; PLAN: r0=458(x), r1=20(y), r2=43(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 20
LDI r2, 43
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
