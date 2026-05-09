; DESCRIPTION: Places a magenta 103x65 rectangle at position (55, 40).
; PLAN: r0=55(x), r1=40(y), r2=103(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 40
LDI r2, 103
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
