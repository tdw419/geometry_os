; DESCRIPTION: Places a magenta 22x63 rectangle at position (405, 125).
; PLAN: r0=405(x), r1=125(y), r2=22(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 125
LDI r2, 22
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
