; DESCRIPTION: Places a green 113x90 rectangle at position (153, 131).
; PLAN: r0=153(x), r1=131(y), r2=113(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 131
LDI r2, 113
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
