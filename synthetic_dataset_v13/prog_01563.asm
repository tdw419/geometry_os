; DESCRIPTION: Places a orange 93x72 rectangle at position (401, 24).
; PLAN: r0=401(x), r1=24(y), r2=93(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 24
LDI r2, 93
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
