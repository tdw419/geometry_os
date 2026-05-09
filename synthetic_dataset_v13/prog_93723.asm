; DESCRIPTION: Draws a cyan rectangle at (23, 152) with width 39 and height 87.
; PLAN: r0=23(x), r1=152(y), r2=39(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 152
LDI r2, 39
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
