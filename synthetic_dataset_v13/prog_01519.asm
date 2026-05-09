; DESCRIPTION: Places a white 28x15 rectangle at position (120, 152).
; PLAN: r0=120(x), r1=152(y), r2=28(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 152
LDI r2, 28
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
