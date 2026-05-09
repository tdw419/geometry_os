; DESCRIPTION: Places a green 113x69 rectangle at position (387, 20).
; PLAN: r0=387(x), r1=20(y), r2=113(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 20
LDI r2, 113
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
