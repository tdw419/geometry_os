; DESCRIPTION: Places a red 58x113 rectangle at position (335, 47).
; PLAN: r0=335(x), r1=47(y), r2=58(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 47
LDI r2, 58
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
