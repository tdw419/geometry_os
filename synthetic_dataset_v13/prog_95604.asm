; DESCRIPTION: Places a orange 117x28 rectangle at position (385, 206).
; PLAN: r0=385(x), r1=206(y), r2=117(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 206
LDI r2, 117
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
