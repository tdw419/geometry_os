; DESCRIPTION: Places a magenta 13x105 rectangle at position (410, 72).
; PLAN: r0=410(x), r1=72(y), r2=13(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 72
LDI r2, 13
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
