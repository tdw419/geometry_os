; DESCRIPTION: Places a magenta 24x69 rectangle at position (393, 134).
; PLAN: r0=393(x), r1=134(y), r2=24(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 134
LDI r2, 24
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
