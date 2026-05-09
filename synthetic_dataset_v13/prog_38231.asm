; DESCRIPTION: Places a blue 82x23 rectangle at position (218, 113).
; PLAN: r0=218(x), r1=113(y), r2=82(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 113
LDI r2, 82
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
