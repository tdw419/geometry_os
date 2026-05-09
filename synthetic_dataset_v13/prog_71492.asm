; DESCRIPTION: Draws a cyan rectangle at (202, 79) with width 109 and height 24.
; PLAN: r0=202(x), r1=79(y), r2=109(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 79
LDI r2, 109
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
