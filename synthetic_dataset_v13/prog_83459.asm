; DESCRIPTION: Places a blue 82x38 rectangle at position (280, 31).
; PLAN: r0=280(x), r1=31(y), r2=82(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 31
LDI r2, 82
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
