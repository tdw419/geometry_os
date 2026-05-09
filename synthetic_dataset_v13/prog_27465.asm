; DESCRIPTION: Places a yellow 81x53 rectangle at position (20, 113).
; PLAN: r0=20(x), r1=113(y), r2=81(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 113
LDI r2, 81
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
