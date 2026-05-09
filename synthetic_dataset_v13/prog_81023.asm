; DESCRIPTION: Places a magenta 40x76 rectangle at position (185, 109).
; PLAN: r0=185(x), r1=109(y), r2=40(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 109
LDI r2, 40
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
