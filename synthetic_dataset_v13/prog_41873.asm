; DESCRIPTION: Places a white 72x40 rectangle at position (410, 53).
; PLAN: r0=410(x), r1=53(y), r2=72(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 53
LDI r2, 72
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
