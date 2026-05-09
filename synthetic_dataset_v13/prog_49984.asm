; DESCRIPTION: Renders a magenta box of size 82x58 starting at (104, 193).
; PLAN: r0=104(x), r1=193(y), r2=82(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 193
LDI r2, 82
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
