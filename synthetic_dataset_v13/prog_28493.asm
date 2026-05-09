; DESCRIPTION: Places a red 72x80 rectangle at position (284, 19).
; PLAN: r0=284(x), r1=19(y), r2=72(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 19
LDI r2, 72
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
