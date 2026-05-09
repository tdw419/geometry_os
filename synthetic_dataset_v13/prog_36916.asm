; DESCRIPTION: Places a yellow 117x90 rectangle at position (380, 1).
; PLAN: r0=380(x), r1=1(y), r2=117(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 1
LDI r2, 117
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
