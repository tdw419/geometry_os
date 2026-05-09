; DESCRIPTION: Draws a cyan rectangle at (305, 32) with width 55 and height 50.
; PLAN: r0=305(x), r1=32(y), r2=55(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 32
LDI r2, 55
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
