; DESCRIPTION: Places a green 39x28 rectangle at position (303, 19).
; PLAN: r0=303(x), r1=19(y), r2=39(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 19
LDI r2, 39
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
