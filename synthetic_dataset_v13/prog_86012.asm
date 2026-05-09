; DESCRIPTION: Places a magenta 44x36 rectangle at position (159, 166).
; PLAN: r0=159(x), r1=166(y), r2=44(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 166
LDI r2, 44
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
