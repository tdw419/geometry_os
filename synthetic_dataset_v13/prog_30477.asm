; DESCRIPTION: Places a green 104x52 rectangle at position (354, 41).
; PLAN: r0=354(x), r1=41(y), r2=104(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 41
LDI r2, 104
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
