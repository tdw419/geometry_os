; DESCRIPTION: Places a yellow 44x90 rectangle at position (142, 134).
; PLAN: r0=142(x), r1=134(y), r2=44(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 134
LDI r2, 44
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
