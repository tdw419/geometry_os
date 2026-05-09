; DESCRIPTION: Draws a cyan rectangle at (294, 168) with width 65 and height 38.
; PLAN: r0=294(x), r1=168(y), r2=65(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 168
LDI r2, 65
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
