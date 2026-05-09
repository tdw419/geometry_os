; DESCRIPTION: Renders a magenta box of size 93x39 starting at (354, 48).
; PLAN: r0=354(x), r1=48(y), r2=93(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 48
LDI r2, 93
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
