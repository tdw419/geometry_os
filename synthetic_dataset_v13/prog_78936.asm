; DESCRIPTION: Places a blue 44x103 rectangle at position (103, 20).
; PLAN: r0=103(x), r1=20(y), r2=44(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 20
LDI r2, 44
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
