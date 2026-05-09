; DESCRIPTION: Places a magenta 107x91 rectangle at position (153, 109).
; PLAN: r0=153(x), r1=109(y), r2=107(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 109
LDI r2, 107
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
