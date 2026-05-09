; DESCRIPTION: Draws a cyan rectangle at (263, 39) with width 59 and height 95.
; PLAN: r0=263(x), r1=39(y), r2=59(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 39
LDI r2, 59
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
