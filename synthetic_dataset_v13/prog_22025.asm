; DESCRIPTION: Renders a magenta box of size 82x14 starting at (262, 3).
; PLAN: r0=262(x), r1=3(y), r2=82(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 3
LDI r2, 82
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
