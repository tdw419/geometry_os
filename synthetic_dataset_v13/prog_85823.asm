; DESCRIPTION: Renders a magenta box of size 87x33 starting at (405, 63).
; PLAN: r0=405(x), r1=63(y), r2=87(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 63
LDI r2, 87
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
