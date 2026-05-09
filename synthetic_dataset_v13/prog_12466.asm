; DESCRIPTION: Renders a magenta box of size 94x55 starting at (354, 165).
; PLAN: r0=354(x), r1=165(y), r2=94(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 165
LDI r2, 94
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
