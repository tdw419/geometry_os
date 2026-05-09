; DESCRIPTION: Creates a green rectangular region at (215, 39) spanning 27 by 29 pixels.
; PLAN: r0=215(x), r1=39(y), r2=27(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 39
LDI r2, 27
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
