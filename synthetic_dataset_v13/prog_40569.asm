; DESCRIPTION: Places a white 109x19 rectangle at position (296, 215).
; PLAN: r0=296(x), r1=215(y), r2=109(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 215
LDI r2, 109
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
