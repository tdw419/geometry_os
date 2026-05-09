; DESCRIPTION: Places a white 28x117 rectangle at position (152, 136).
; PLAN: r0=152(x), r1=136(y), r2=28(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 136
LDI r2, 28
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
