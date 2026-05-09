; DESCRIPTION: Places a white 32x80 rectangle at position (280, 116).
; PLAN: r0=280(x), r1=116(y), r2=32(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 116
LDI r2, 32
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
