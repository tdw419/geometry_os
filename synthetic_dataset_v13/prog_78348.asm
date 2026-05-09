; DESCRIPTION: Places a yellow 20x56 rectangle at position (460, 53).
; PLAN: r0=460(x), r1=53(y), r2=20(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 53
LDI r2, 20
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
