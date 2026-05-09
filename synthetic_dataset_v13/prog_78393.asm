; DESCRIPTION: Places a white 33x48 rectangle at position (30, 30).
; PLAN: r0=30(x), r1=30(y), r2=33(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 30
LDI r2, 33
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
