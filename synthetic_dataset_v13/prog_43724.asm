; DESCRIPTION: Draws a cyan rectangle at (284, 193) with width 109 and height 10.
; PLAN: r0=284(x), r1=193(y), r2=109(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 193
LDI r2, 109
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
