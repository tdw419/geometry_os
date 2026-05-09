; DESCRIPTION: Places a black 102x18 rectangle at position (304, 236).
; PLAN: r0=304(x), r1=236(y), r2=102(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 236
LDI r2, 102
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
