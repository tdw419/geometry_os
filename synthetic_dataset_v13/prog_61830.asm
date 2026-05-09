; DESCRIPTION: Places a white 100x120 rectangle at position (153, 95).
; PLAN: r0=153(x), r1=95(y), r2=100(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 95
LDI r2, 100
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
