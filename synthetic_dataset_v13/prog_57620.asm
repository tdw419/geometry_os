; DESCRIPTION: Renders a magenta box of size 70x120 starting at (262, 124).
; PLAN: r0=262(x), r1=124(y), r2=70(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 124
LDI r2, 70
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
