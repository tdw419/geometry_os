; DESCRIPTION: Draws a cyan rectangle at (218, 16) with width 13 and height 32.
; PLAN: r0=218(x), r1=16(y), r2=13(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 16
LDI r2, 13
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
