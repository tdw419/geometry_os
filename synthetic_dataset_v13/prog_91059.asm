; DESCRIPTION: Places a yellow 28x67 rectangle at position (200, 48).
; PLAN: r0=200(x), r1=48(y), r2=28(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 48
LDI r2, 28
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
