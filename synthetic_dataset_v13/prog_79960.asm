; DESCRIPTION: Places a black 28x20 rectangle at position (403, 135).
; PLAN: r0=403(x), r1=135(y), r2=28(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 135
LDI r2, 28
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
