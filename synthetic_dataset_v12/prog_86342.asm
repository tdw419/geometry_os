; DESCRIPTION: Places a red 105x85 rectangle at position (197, 55).
; PLAN: r0=197(x), r1=55(y), r2=105(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 55
LDI r2, 105
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
