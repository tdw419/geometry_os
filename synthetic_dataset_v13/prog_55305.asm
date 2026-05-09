; DESCRIPTION: Places a white 103x46 rectangle at position (72, 152).
; PLAN: r0=72(x), r1=152(y), r2=103(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 152
LDI r2, 103
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
