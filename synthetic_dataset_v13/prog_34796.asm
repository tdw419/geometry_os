; DESCRIPTION: Places a yellow 39x38 rectangle at position (77, 71).
; PLAN: r0=77(x), r1=71(y), r2=39(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 71
LDI r2, 39
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
