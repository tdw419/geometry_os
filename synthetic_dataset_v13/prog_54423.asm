; DESCRIPTION: Renders a magenta box of size 73x14 starting at (146, 24).
; PLAN: r0=146(x), r1=24(y), r2=73(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 24
LDI r2, 73
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
