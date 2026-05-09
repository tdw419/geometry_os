; DESCRIPTION: Draws a cyan rectangle at (370, 228) with width 97 and height 10.
; PLAN: r0=370(x), r1=228(y), r2=97(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 228
LDI r2, 97
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
