; DESCRIPTION: Places a white 117x39 rectangle at position (248, 215).
; PLAN: r0=248(x), r1=215(y), r2=117(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 215
LDI r2, 117
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
