; DESCRIPTION: Places a white 69x16 rectangle at position (34, 236).
; PLAN: r0=34(x), r1=236(y), r2=69(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 236
LDI r2, 69
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
