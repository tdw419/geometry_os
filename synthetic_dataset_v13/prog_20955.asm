; DESCRIPTION: Places a white 85x63 rectangle at position (403, 184).
; PLAN: r0=403(x), r1=184(y), r2=85(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 184
LDI r2, 85
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
