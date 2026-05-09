; DESCRIPTION: Draws a cyan rectangle at (245, 205) with width 17 and height 17.
; PLAN: r0=245(x), r1=205(y), r2=17(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 205
LDI r2, 17
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
