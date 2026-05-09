; DESCRIPTION: Places a magenta 34x111 rectangle at position (275, 63).
; PLAN: r0=275(x), r1=63(y), r2=34(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 63
LDI r2, 34
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
