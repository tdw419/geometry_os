; DESCRIPTION: Places a green 36x38 rectangle at position (71, 1).
; PLAN: r0=71(x), r1=1(y), r2=36(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 1
LDI r2, 36
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
