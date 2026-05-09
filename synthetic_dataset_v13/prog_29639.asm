; DESCRIPTION: Renders a magenta box of size 22x23 starting at (298, 212).
; PLAN: r0=298(x), r1=212(y), r2=22(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 212
LDI r2, 22
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
