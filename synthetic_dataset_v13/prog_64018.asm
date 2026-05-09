; DESCRIPTION: Places a orange 111x61 rectangle at position (349, 99).
; PLAN: r0=349(x), r1=99(y), r2=111(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 99
LDI r2, 111
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
