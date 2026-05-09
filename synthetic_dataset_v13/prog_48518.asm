; DESCRIPTION: Draws a cyan rectangle at (61, 72) with width 50 and height 103.
; PLAN: r0=61(x), r1=72(y), r2=50(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 72
LDI r2, 50
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
