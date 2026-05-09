; DESCRIPTION: Places a white 110x32 rectangle at position (198, 161).
; PLAN: r0=198(x), r1=161(y), r2=110(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 161
LDI r2, 110
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
