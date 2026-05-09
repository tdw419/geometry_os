; DESCRIPTION: Places a white 39x12 rectangle at position (198, 152).
; PLAN: r0=198(x), r1=152(y), r2=39(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 152
LDI r2, 39
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
