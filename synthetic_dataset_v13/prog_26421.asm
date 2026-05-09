; DESCRIPTION: Places a black 54x34 rectangle at position (209, 52).
; PLAN: r0=209(x), r1=52(y), r2=54(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 52
LDI r2, 54
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
