; DESCRIPTION: Places a white 20x27 rectangle at position (60, 99).
; PLAN: r0=60(x), r1=99(y), r2=20(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 99
LDI r2, 20
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
