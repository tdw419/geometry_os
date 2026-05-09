; DESCRIPTION: Renders a magenta box of size 120x75 starting at (59, 129).
; PLAN: r0=59(x), r1=129(y), r2=120(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 129
LDI r2, 120
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
