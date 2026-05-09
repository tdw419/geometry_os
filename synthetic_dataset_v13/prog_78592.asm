; DESCRIPTION: Renders a magenta box of size 38x18 starting at (258, 143).
; PLAN: r0=258(x), r1=143(y), r2=38(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 143
LDI r2, 38
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
