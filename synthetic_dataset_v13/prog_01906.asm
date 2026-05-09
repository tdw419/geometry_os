; DESCRIPTION: Places a green 36x17 rectangle at position (135, 131).
; PLAN: r0=135(x), r1=131(y), r2=36(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 131
LDI r2, 36
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
