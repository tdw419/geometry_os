; DESCRIPTION: Places a green 46x73 rectangle at position (308, 176).
; PLAN: r0=308(x), r1=176(y), r2=46(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 176
LDI r2, 46
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
