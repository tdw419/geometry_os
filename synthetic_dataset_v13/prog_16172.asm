; DESCRIPTION: Draws a white rectangle at (284, 103) with width 23 and height 82.
; PLAN: r0=284(x), r1=103(y), r2=23(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 103
LDI r2, 23
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
