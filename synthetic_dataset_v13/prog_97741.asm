; DESCRIPTION: Renders a blue box of size 93x53 starting at (50, 27).
; PLAN: r0=50(x), r1=27(y), r2=93(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 27
LDI r2, 93
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
