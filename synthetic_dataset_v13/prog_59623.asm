; DESCRIPTION: Renders a magenta box of size 37x50 starting at (327, 170).
; PLAN: r0=327(x), r1=170(y), r2=37(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 170
LDI r2, 37
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
