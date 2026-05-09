; DESCRIPTION: Places a magenta 110x28 rectangle at position (380, 49).
; PLAN: r0=380(x), r1=49(y), r2=110(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 49
LDI r2, 110
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
