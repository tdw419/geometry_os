; DESCRIPTION: Places a blue 82x102 rectangle at position (245, 80).
; PLAN: r0=245(x), r1=80(y), r2=82(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 80
LDI r2, 82
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
