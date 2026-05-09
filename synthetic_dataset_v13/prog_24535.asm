; DESCRIPTION: Places a red 87x61 rectangle at position (73, 152).
; PLAN: r0=73(x), r1=152(y), r2=87(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 152
LDI r2, 87
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
