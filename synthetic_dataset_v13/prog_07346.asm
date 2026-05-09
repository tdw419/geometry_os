; DESCRIPTION: Places a yellow 10x113 rectangle at position (251, 38).
; PLAN: r0=251(x), r1=38(y), r2=10(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 38
LDI r2, 10
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
