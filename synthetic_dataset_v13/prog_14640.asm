; DESCRIPTION: Places a magenta 14x103 rectangle at position (280, 107).
; PLAN: r0=280(x), r1=107(y), r2=14(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 107
LDI r2, 14
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
