; DESCRIPTION: Places a red 41x54 rectangle at position (96, 59).
; PLAN: r0=96(x), r1=59(y), r2=41(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 59
LDI r2, 41
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
