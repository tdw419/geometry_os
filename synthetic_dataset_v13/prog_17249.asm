; DESCRIPTION: Places a red 14x70 rectangle at position (408, 121).
; PLAN: r0=408(x), r1=121(y), r2=14(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 121
LDI r2, 14
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
