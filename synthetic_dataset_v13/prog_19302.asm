; DESCRIPTION: Renders a magenta box of size 113x74 starting at (385, 57).
; PLAN: r0=385(x), r1=57(y), r2=113(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 57
LDI r2, 113
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
