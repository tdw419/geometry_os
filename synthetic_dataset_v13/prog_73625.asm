; DESCRIPTION: Places a red 14x43 rectangle at position (218, 36).
; PLAN: r0=218(x), r1=36(y), r2=14(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 36
LDI r2, 14
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
