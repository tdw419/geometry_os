; DESCRIPTION: Places a yellow 72x67 rectangle at position (391, 52).
; PLAN: r0=391(x), r1=52(y), r2=72(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 52
LDI r2, 72
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
