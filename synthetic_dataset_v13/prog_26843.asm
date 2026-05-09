; DESCRIPTION: Places a magenta 28x75 rectangle at position (120, 33).
; PLAN: r0=120(x), r1=33(y), r2=28(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 33
LDI r2, 28
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
