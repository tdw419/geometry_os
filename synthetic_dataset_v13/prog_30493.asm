; DESCRIPTION: Renders a magenta box of size 75x45 starting at (418, 85).
; PLAN: r0=418(x), r1=85(y), r2=75(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 85
LDI r2, 75
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
