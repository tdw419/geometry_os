; DESCRIPTION: Places a red 18x23 rectangle at position (379, 44).
; PLAN: r0=379(x), r1=44(y), r2=18(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 44
LDI r2, 18
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
