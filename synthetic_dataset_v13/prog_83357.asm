; DESCRIPTION: Renders a magenta box of size 50x102 starting at (364, 86).
; PLAN: r0=364(x), r1=86(y), r2=50(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 86
LDI r2, 50
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
