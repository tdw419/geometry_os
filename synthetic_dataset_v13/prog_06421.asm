; DESCRIPTION: Places a green 28x112 rectangle at position (440, 80).
; PLAN: r0=440(x), r1=80(y), r2=28(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 80
LDI r2, 28
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
