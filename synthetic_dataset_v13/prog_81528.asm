; DESCRIPTION: Places a white 38x79 rectangle at position (103, 153).
; PLAN: r0=103(x), r1=153(y), r2=38(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 153
LDI r2, 38
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
