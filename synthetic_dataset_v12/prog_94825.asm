; DESCRIPTION: Places a green 105x27 rectangle at position (70, 47).
; PLAN: r0=70(x), r1=47(y), r2=105(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 47
LDI r2, 105
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
