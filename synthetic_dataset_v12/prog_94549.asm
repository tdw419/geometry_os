; DESCRIPTION: Places a red 86x41 rectangle at position (284, 179).
; PLAN: r0=284(x), r1=179(y), r2=86(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 179
LDI r2, 86
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
