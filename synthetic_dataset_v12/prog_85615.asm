; DESCRIPTION: Renders a magenta box of size 22x87 starting at (464, 34).
; PLAN: r0=464(x), r1=34(y), r2=22(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 34
LDI r2, 22
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
