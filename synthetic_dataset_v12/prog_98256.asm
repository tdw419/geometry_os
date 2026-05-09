; DESCRIPTION: Places a magenta 21x51 rectangle at position (171, 29).
; PLAN: r0=171(x), r1=29(y), r2=21(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 29
LDI r2, 21
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
