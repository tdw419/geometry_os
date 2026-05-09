; DESCRIPTION: Places a white 61x104 rectangle at position (189, 55).
; PLAN: r0=189(x), r1=55(y), r2=61(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 55
LDI r2, 61
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
