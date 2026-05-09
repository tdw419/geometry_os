; DESCRIPTION: Places a green 45x27 rectangle at position (125, 53).
; PLAN: r0=125(x), r1=53(y), r2=45(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 53
LDI r2, 45
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
