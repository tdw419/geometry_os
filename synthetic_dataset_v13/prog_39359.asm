; DESCRIPTION: Renders a magenta box of size 55x28 starting at (281, 1).
; PLAN: r0=281(x), r1=1(y), r2=55(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 1
LDI r2, 55
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
