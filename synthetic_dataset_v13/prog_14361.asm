; DESCRIPTION: Places a white 12x32 rectangle at position (218, 214).
; PLAN: r0=218(x), r1=214(y), r2=12(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 214
LDI r2, 12
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
