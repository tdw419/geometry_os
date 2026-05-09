; DESCRIPTION: Places a purple 38x40 rectangle at position (460, 76).
; PLAN: r0=460(x), r1=76(y), r2=38(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 76
LDI r2, 38
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
