; DESCRIPTION: Draws a cyan rectangle at (186, 173) with width 63 and height 82.
; PLAN: r0=186(x), r1=173(y), r2=63(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 173
LDI r2, 63
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
