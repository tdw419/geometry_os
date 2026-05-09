; DESCRIPTION: Places a blue 36x50 rectangle at position (357, 187).
; PLAN: r0=357(x), r1=187(y), r2=36(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 187
LDI r2, 36
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
