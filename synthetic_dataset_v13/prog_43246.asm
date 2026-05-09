; DESCRIPTION: Draws a cyan rectangle at (247, 191) with width 48 and height 53.
; PLAN: r0=247(x), r1=191(y), r2=48(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 191
LDI r2, 48
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
