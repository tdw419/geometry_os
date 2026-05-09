; DESCRIPTION: Draws a cyan rectangle at (284, 60) with width 111 and height 11.
; PLAN: r0=284(x), r1=60(y), r2=111(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 60
LDI r2, 111
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
