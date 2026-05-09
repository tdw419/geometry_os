; DESCRIPTION: Places a red 90x99 rectangle at position (18, 29).
; PLAN: r0=18(x), r1=29(y), r2=90(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 29
LDI r2, 90
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
