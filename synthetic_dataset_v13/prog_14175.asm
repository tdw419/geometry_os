; DESCRIPTION: Renders a magenta box of size 111x28 starting at (262, 138).
; PLAN: r0=262(x), r1=138(y), r2=111(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 138
LDI r2, 111
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
