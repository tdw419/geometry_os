; DESCRIPTION: Places a white 67x104 rectangle at position (374, 42).
; PLAN: r0=374(x), r1=42(y), r2=67(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 42
LDI r2, 67
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
