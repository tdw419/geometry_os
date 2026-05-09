; DESCRIPTION: Places a magenta 107x111 rectangle at position (165, 45).
; PLAN: r0=165(x), r1=45(y), r2=107(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 45
LDI r2, 107
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
