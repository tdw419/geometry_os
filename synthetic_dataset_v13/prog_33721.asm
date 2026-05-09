; DESCRIPTION: Places a blue 61x42 rectangle at position (415, 12).
; PLAN: r0=415(x), r1=12(y), r2=61(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 12
LDI r2, 61
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
