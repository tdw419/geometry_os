; DESCRIPTION: Places a green 79x98 rectangle at position (28, 80).
; PLAN: r0=28(x), r1=80(y), r2=79(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 80
LDI r2, 79
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
