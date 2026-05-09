; DESCRIPTION: Draws a cyan rectangle at (346, 204) with width 21 and height 15.
; PLAN: r0=346(x), r1=204(y), r2=21(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 204
LDI r2, 21
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
