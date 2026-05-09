; DESCRIPTION: Places a blue 21x109 rectangle at position (217, 92).
; PLAN: r0=217(x), r1=92(y), r2=21(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 92
LDI r2, 21
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
