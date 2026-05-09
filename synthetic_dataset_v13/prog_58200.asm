; DESCRIPTION: Places a red 46x61 rectangle at position (336, 5).
; PLAN: r0=336(x), r1=5(y), r2=46(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 5
LDI r2, 46
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
