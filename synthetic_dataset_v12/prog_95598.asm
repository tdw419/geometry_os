; DESCRIPTION: Places a magenta 96x56 rectangle at position (320, 96).
; PLAN: r0=320(x), r1=96(y), r2=96(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 96
LDI r2, 96
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
