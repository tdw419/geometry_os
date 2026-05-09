; DESCRIPTION: Places a white 59x30 rectangle at position (411, 221).
; PLAN: r0=411(x), r1=221(y), r2=59(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 221
LDI r2, 59
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
