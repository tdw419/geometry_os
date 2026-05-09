; DESCRIPTION: Places a orange 61x24 rectangle at position (350, 52).
; PLAN: r0=350(x), r1=52(y), r2=61(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 52
LDI r2, 61
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
