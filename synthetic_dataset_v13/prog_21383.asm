; DESCRIPTION: Places a green 55x28 rectangle at position (387, 203).
; PLAN: r0=387(x), r1=203(y), r2=55(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 203
LDI r2, 55
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
