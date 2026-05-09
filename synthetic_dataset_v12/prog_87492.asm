; DESCRIPTION: Places a green 83x19 rectangle at position (416, 71).
; PLAN: r0=416(x), r1=71(y), r2=83(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 71
LDI r2, 83
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
