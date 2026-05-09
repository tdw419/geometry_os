; DESCRIPTION: Draws a white rectangle at (218, 53) with width 48 and height 103.
; PLAN: r0=218(x), r1=53(y), r2=48(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 53
LDI r2, 48
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
