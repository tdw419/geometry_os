; DESCRIPTION: Places a green 108x21 rectangle at position (284, 181).
; PLAN: r0=284(x), r1=181(y), r2=108(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 181
LDI r2, 108
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
