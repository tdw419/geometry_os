; DESCRIPTION: Places a orange 92x114 rectangle at position (239, 117).
; PLAN: r0=239(x), r1=117(y), r2=92(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 117
LDI r2, 92
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
