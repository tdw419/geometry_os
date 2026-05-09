; DESCRIPTION: Places a blue 76x53 rectangle at position (340, 33).
; PLAN: r0=340(x), r1=33(y), r2=76(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 33
LDI r2, 76
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
