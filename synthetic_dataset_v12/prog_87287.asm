; DESCRIPTION: Renders a magenta box of size 47x32 starting at (432, 172).
; PLAN: r0=432(x), r1=172(y), r2=47(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 172
LDI r2, 47
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
