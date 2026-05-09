; DESCRIPTION: Renders a magenta box of size 17x57 starting at (346, 3).
; PLAN: r0=346(x), r1=3(y), r2=17(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 3
LDI r2, 17
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
