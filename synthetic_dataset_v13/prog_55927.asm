; DESCRIPTION: Places a blue 92x48 rectangle at position (148, 178).
; PLAN: r0=148(x), r1=178(y), r2=92(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 178
LDI r2, 92
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
