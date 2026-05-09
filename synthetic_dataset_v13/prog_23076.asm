; DESCRIPTION: Places a green 49x92 rectangle at position (108, 117).
; PLAN: r0=108(x), r1=117(y), r2=49(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 117
LDI r2, 49
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
