; DESCRIPTION: Renders a magenta box of size 30x86 starting at (415, 123).
; PLAN: r0=415(x), r1=123(y), r2=30(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 123
LDI r2, 30
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
