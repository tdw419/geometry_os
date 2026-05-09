; DESCRIPTION: Places a purple 21x55 rectangle at position (320, 0).
; PLAN: r0=320(x), r1=0(y), r2=21(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 0
LDI r2, 21
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
