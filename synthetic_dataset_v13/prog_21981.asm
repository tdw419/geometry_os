; DESCRIPTION: Places a red 57x46 rectangle at position (34, 21).
; PLAN: r0=34(x), r1=21(y), r2=57(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 21
LDI r2, 57
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
