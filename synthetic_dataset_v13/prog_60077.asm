; DESCRIPTION: Draws a cyan rectangle at (365, 161) with width 40 and height 76.
; PLAN: r0=365(x), r1=161(y), r2=40(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 161
LDI r2, 40
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
