; DESCRIPTION: Places a yellow 44x53 rectangle at position (415, 90).
; PLAN: r0=415(x), r1=90(y), r2=44(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 90
LDI r2, 44
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
