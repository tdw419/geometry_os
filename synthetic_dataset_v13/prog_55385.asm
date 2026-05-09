; DESCRIPTION: Places a blue 92x92 rectangle at position (401, 148).
; PLAN: r0=401(x), r1=148(y), r2=92(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 148
LDI r2, 92
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
