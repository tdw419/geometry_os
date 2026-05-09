; DESCRIPTION: Draws a cyan rectangle at (323, 86) with width 64 and height 82.
; PLAN: r0=323(x), r1=86(y), r2=64(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 86
LDI r2, 64
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
