; DESCRIPTION: Places a purple 12x59 rectangle at position (499, 16).
; PLAN: r0=499(x), r1=16(y), r2=12(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 16
LDI r2, 12
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
