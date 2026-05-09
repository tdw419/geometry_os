; DESCRIPTION: Places a red 44x36 rectangle at position (284, 215).
; PLAN: r0=284(x), r1=215(y), r2=44(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 215
LDI r2, 44
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
