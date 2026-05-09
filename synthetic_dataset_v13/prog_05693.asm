; DESCRIPTION: Places a green 28x34 rectangle at position (150, 150).
; PLAN: r0=150(x), r1=150(y), r2=28(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 150
LDI r2, 28
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
