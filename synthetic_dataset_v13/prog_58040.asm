; DESCRIPTION: Places a black 120x31 rectangle at position (372, 212).
; PLAN: r0=372(x), r1=212(y), r2=120(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 212
LDI r2, 120
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
