; DESCRIPTION: Places a green 95x43 rectangle at position (7, 71).
; PLAN: r0=7(x), r1=71(y), r2=95(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 71
LDI r2, 95
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
