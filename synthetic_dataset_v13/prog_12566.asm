; DESCRIPTION: Places a white 58x120 rectangle at position (53, 48).
; PLAN: r0=53(x), r1=48(y), r2=58(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 48
LDI r2, 58
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
