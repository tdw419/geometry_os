; DESCRIPTION: Places a magenta 109x36 rectangle at position (294, 175).
; PLAN: r0=294(x), r1=175(y), r2=109(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 175
LDI r2, 109
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
