; DESCRIPTION: Places a magenta 48x43 rectangle at position (213, 48).
; PLAN: r0=213(x), r1=48(y), r2=48(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 48
LDI r2, 48
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
