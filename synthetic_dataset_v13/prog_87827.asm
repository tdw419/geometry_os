; DESCRIPTION: Draws a white rectangle at (284, 111) with width 46 and height 33.
; PLAN: r0=284(x), r1=111(y), r2=46(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 111
LDI r2, 46
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
