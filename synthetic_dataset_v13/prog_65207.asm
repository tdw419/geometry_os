; DESCRIPTION: Places a blue 92x47 rectangle at position (154, 175).
; PLAN: r0=154(x), r1=175(y), r2=92(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 175
LDI r2, 92
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
