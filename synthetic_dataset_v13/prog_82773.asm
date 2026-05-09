; DESCRIPTION: Places a blue 28x40 rectangle at position (333, 33).
; PLAN: r0=333(x), r1=33(y), r2=28(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 33
LDI r2, 28
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
