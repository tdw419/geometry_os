; DESCRIPTION: Renders a magenta box of size 44x54 starting at (32, 134).
; PLAN: r0=32(x), r1=134(y), r2=44(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 134
LDI r2, 44
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
