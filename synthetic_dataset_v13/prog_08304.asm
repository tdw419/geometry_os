; DESCRIPTION: Places a green 36x116 rectangle at position (420, 41).
; PLAN: r0=420(x), r1=41(y), r2=36(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 41
LDI r2, 36
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
