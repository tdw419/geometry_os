; DESCRIPTION: Renders a magenta box of size 94x81 starting at (394, 17).
; PLAN: r0=394(x), r1=17(y), r2=94(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 17
LDI r2, 94
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
