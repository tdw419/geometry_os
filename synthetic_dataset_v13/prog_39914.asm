; DESCRIPTION: Renders a magenta box of size 52x95 starting at (146, 73).
; PLAN: r0=146(x), r1=73(y), r2=52(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 73
LDI r2, 52
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
