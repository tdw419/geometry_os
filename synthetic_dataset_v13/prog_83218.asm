; DESCRIPTION: Places a magenta 55x111 rectangle at position (72, 72).
; PLAN: r0=72(x), r1=72(y), r2=55(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 72
LDI r2, 55
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
