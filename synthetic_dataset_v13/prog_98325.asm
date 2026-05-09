; DESCRIPTION: Places a magenta 98x11 rectangle at position (406, 22).
; PLAN: r0=406(x), r1=22(y), r2=98(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 22
LDI r2, 98
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
