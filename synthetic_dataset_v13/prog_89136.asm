; DESCRIPTION: Places a yellow 41x113 rectangle at position (144, 135).
; PLAN: r0=144(x), r1=135(y), r2=41(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 135
LDI r2, 41
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
