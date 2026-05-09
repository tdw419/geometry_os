; DESCRIPTION: Places a red 106x25 rectangle at position (280, 35).
; PLAN: r0=280(x), r1=35(y), r2=106(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 35
LDI r2, 106
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
