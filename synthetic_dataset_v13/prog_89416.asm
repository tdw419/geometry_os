; DESCRIPTION: Draws a cyan rectangle at (202, 1) with width 32 and height 48.
; PLAN: r0=202(x), r1=1(y), r2=32(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 1
LDI r2, 32
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
