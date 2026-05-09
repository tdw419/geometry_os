; DESCRIPTION: Places a yellow 67x77 rectangle at position (368, 68).
; PLAN: r0=368(x), r1=68(y), r2=67(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 68
LDI r2, 67
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
