; DESCRIPTION: Places a white 64x91 rectangle at position (214, 152).
; PLAN: r0=214(x), r1=152(y), r2=64(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 152
LDI r2, 64
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
