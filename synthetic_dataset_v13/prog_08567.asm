; DESCRIPTION: Renders a magenta box of size 47x115 starting at (225, 76).
; PLAN: r0=225(x), r1=76(y), r2=47(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 76
LDI r2, 47
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
