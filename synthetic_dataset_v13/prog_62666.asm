; DESCRIPTION: Places a blue 69x51 rectangle at position (174, 181).
; PLAN: r0=174(x), r1=181(y), r2=69(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 181
LDI r2, 69
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
