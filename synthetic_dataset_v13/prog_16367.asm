; DESCRIPTION: Places a blue 17x53 rectangle at position (487, 19).
; PLAN: r0=487(x), r1=19(y), r2=17(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 19
LDI r2, 17
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
