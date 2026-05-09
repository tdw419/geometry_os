; DESCRIPTION: Places a blue 77x20 rectangle at position (50, 34).
; PLAN: r0=50(x), r1=34(y), r2=77(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 34
LDI r2, 77
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
