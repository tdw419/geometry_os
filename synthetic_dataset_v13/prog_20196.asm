; DESCRIPTION: Places a black 84x113 rectangle at position (284, 108).
; PLAN: r0=284(x), r1=108(y), r2=84(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 108
LDI r2, 84
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
