; DESCRIPTION: Places a white 33x85 rectangle at position (176, 60).
; PLAN: r0=176(x), r1=60(y), r2=33(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 60
LDI r2, 33
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
