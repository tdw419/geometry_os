; DESCRIPTION: Places a magenta 22x14 rectangle at position (275, 149).
; PLAN: r0=275(x), r1=149(y), r2=22(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 149
LDI r2, 22
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
