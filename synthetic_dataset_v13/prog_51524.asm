; DESCRIPTION: Places a white 102x18 rectangle at position (123, 215).
; PLAN: r0=123(x), r1=215(y), r2=102(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 215
LDI r2, 102
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
