; DESCRIPTION: Draws a cyan rectangle at (365, 171) with width 98 and height 59.
; PLAN: r0=365(x), r1=171(y), r2=98(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 171
LDI r2, 98
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
