; DESCRIPTION: Places a magenta 98x64 rectangle at position (331, 108).
; PLAN: r0=331(x), r1=108(y), r2=98(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 108
LDI r2, 98
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
