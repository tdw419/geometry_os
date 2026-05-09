; DESCRIPTION: Places a white 83x120 rectangle at position (164, 10).
; PLAN: r0=164(x), r1=10(y), r2=83(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 10
LDI r2, 83
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
