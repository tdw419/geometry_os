; DESCRIPTION: Places a white 71x84 rectangle at position (400, 32).
; PLAN: r0=400(x), r1=32(y), r2=71(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 32
LDI r2, 71
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
