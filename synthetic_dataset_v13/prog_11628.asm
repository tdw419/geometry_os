; DESCRIPTION: Renders a magenta box of size 75x53 starting at (434, 148).
; PLAN: r0=434(x), r1=148(y), r2=75(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 148
LDI r2, 75
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
