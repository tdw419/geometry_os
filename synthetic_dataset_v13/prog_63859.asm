; DESCRIPTION: Draws a cyan rectangle at (379, 27) with width 93 and height 71.
; PLAN: r0=379(x), r1=27(y), r2=93(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 27
LDI r2, 93
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
