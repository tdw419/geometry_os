; DESCRIPTION: Places a red 106x110 rectangle at position (28, 94).
; PLAN: r0=28(x), r1=94(y), r2=106(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 94
LDI r2, 106
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
