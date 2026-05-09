; DESCRIPTION: Places a yellow 69x12 rectangle at position (259, 236).
; PLAN: r0=259(x), r1=236(y), r2=69(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 236
LDI r2, 69
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
