; DESCRIPTION: Places a red 54x82 rectangle at position (433, 49).
; PLAN: r0=433(x), r1=49(y), r2=54(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 49
LDI r2, 54
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
