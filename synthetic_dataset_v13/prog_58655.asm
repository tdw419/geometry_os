; DESCRIPTION: Draws a cyan rectangle at (277, 21) with width 21 and height 103.
; PLAN: r0=277(x), r1=21(y), r2=21(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 21
LDI r2, 21
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
