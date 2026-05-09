; DESCRIPTION: Places a red 75x10 rectangle at position (335, 38).
; PLAN: r0=335(x), r1=38(y), r2=75(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 38
LDI r2, 75
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
