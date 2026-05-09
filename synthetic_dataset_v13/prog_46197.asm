; DESCRIPTION: Draws a cyan rectangle at (284, 40) with width 57 and height 24.
; PLAN: r0=284(x), r1=40(y), r2=57(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 40
LDI r2, 57
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
