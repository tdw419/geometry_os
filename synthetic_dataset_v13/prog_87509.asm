; DESCRIPTION: Places a blue 82x115 rectangle at position (401, 56).
; PLAN: r0=401(x), r1=56(y), r2=82(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 56
LDI r2, 82
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
