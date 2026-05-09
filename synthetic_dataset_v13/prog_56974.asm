; DESCRIPTION: Places a white 63x34 rectangle at position (6, 214).
; PLAN: r0=6(x), r1=214(y), r2=63(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 214
LDI r2, 63
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
