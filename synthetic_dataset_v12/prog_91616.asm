; DESCRIPTION: Places a magenta 103x59 rectangle at position (385, 171).
; PLAN: r0=385(x), r1=171(y), r2=103(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 171
LDI r2, 103
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
