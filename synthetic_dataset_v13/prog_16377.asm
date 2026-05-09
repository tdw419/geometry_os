; DESCRIPTION: Renders a magenta box of size 93x35 starting at (328, 202).
; PLAN: r0=328(x), r1=202(y), r2=93(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 202
LDI r2, 93
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
