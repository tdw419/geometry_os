; DESCRIPTION: Places a white 101x10 rectangle at position (401, 6).
; PLAN: r0=401(x), r1=6(y), r2=101(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 6
LDI r2, 101
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
