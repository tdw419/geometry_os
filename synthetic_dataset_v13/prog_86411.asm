; DESCRIPTION: Places a magenta 99x95 rectangle at position (294, 63).
; PLAN: r0=294(x), r1=63(y), r2=99(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 63
LDI r2, 99
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
