; DESCRIPTION: Places a blue 45x103 rectangle at position (180, 38).
; PLAN: r0=180(x), r1=38(y), r2=45(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 38
LDI r2, 45
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
