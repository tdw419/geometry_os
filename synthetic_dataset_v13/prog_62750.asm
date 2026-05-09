; DESCRIPTION: Places a white 46x87 rectangle at position (261, 13).
; PLAN: r0=261(x), r1=13(y), r2=46(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 13
LDI r2, 46
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
