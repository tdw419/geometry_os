; DESCRIPTION: Places a green 35x103 rectangle at position (125, 92).
; PLAN: r0=125(x), r1=92(y), r2=35(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 92
LDI r2, 35
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
