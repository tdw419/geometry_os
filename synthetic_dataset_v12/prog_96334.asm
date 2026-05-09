; DESCRIPTION: Places a green 39x34 rectangle at position (246, 9).
; PLAN: r0=246(x), r1=9(y), r2=39(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 9
LDI r2, 39
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
