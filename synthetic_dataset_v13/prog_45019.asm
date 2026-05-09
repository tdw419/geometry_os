; DESCRIPTION: Places a white 21x38 rectangle at position (80, 184).
; PLAN: r0=80(x), r1=184(y), r2=21(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 184
LDI r2, 21
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
