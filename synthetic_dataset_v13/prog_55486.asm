; DESCRIPTION: Places a red 48x44 rectangle at position (121, 23).
; PLAN: r0=121(x), r1=23(y), r2=48(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 23
LDI r2, 48
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
