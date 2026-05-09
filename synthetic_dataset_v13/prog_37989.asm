; DESCRIPTION: Places a blue 21x102 rectangle at position (113, 117).
; PLAN: r0=113(x), r1=117(y), r2=21(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 117
LDI r2, 21
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
