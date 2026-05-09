; DESCRIPTION: Places a green 61x23 rectangle at position (376, 171).
; PLAN: r0=376(x), r1=171(y), r2=61(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 171
LDI r2, 61
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
