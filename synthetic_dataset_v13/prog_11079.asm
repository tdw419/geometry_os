; DESCRIPTION: Places a blue 95x116 rectangle at position (46, 51).
; PLAN: r0=46(x), r1=51(y), r2=95(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 51
LDI r2, 95
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
