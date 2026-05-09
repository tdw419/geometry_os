; DESCRIPTION: Places a blue 55x33 rectangle at position (263, 212).
; PLAN: r0=263(x), r1=212(y), r2=55(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 212
LDI r2, 55
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
