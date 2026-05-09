; DESCRIPTION: Places a white 54x104 rectangle at position (403, 41).
; PLAN: r0=403(x), r1=41(y), r2=54(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 41
LDI r2, 54
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
