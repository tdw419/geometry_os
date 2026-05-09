; DESCRIPTION: Places a yellow 113x34 rectangle at position (175, 47).
; PLAN: r0=175(x), r1=47(y), r2=113(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 47
LDI r2, 113
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
