; DESCRIPTION: Places a white 23x95 rectangle at position (412, 106).
; PLAN: r0=412(x), r1=106(y), r2=23(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 106
LDI r2, 23
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
