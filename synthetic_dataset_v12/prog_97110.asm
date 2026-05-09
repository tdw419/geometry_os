; DESCRIPTION: Places a blue 85x110 rectangle at position (288, 92).
; PLAN: r0=288(x), r1=92(y), r2=85(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 92
LDI r2, 85
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
