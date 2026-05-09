; DESCRIPTION: Places a white 63x10 rectangle at position (27, 85).
; PLAN: r0=27(x), r1=85(y), r2=63(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 85
LDI r2, 63
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
